import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class ProductListFormView extends StatelessWidget {
  const ProductListFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListFormController>(
      init: ProductListFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Product List "),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(const ProductFormView());
            },
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("products")
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
                          return InkWell(
                            onTap: () {
                              Get.to(ProductFormView(item: item));
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(
                                    item["photo"] ??
                                        "https://i.ibb.co/S32HNjD/no-image.jpg",
                                  ),
                                ),
                                title: Text(item["product_name"] ?? "-"),
                                subtitle: Text(item["price"] ?? "-"),
                                trailing: InkWell(
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection("products")
                                        .doc(item["id"])
                                        .delete();
                                  },
                                  child: const Icon(Icons.delete),
                                ),
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
