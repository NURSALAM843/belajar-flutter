import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/order_form_controller.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class OrderFormView extends StatelessWidget {
  const OrderFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderFormController>(
      init: OrderFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Order Sepatu"),
            actions: [
              IconButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection("orders").add({
                    "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
                    "product_name":
                        "Kaos Kaki" + Random().nextInt(100).toString(),
                    "price": Random().nextInt(1000),
                    "created_at": Timestamp.now(),
                  });
                },
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                //body
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: null,
                          decoration: const InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            hintText: "Search",
                          ),
                          onChanged: (value) {
                            controller.search = value;
                            controller.update();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("orders")
                        //.where("price", isGreaterThan: 200)
                        //.orderBy("price", descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> item =
                              (data.docs[index].data() as Map<String, dynamic>);
                          item["id"] = data.docs[index].id;

                          //-start filter
                          if (controller.search.isNotEmpty) {
                            var productName =
                                item["product_name"].toString().toLowerCase();
                            var search = controller.search.toLowerCase();

                            if (!productName.contains(search)) {
                              return Container();
                            }
                          }

                          //end filter
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  item["photo"],
                                ),
                              ),
                              title: Text(item["product_name"]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("\$${item["price"]}"),
                                  //timestamp => datetime dgn toDate()
                                  Text("\$${item["created_at"].toDate()}"),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
