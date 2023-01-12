import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class ProductFormView extends StatelessWidget {
  final Map? item;
  const ProductFormView({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFormController>(
      init: ProductFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Product Form"),
            actions: [
              ExButton(
                width: 100.0,
                size: sm,
                label: "Save",
                color: infoColor,
                onPressed: () => controller.doSave(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //body
                  ExImagePicker(
                    id: "photo",
                    label: "Photo",
                    value: item == null ? null : item!["photo"],
                  ),
                  ExTextField(
                    id: "product_name",
                    label: "Product Name",
                    value: item == null ? null : item!["product_name"],
                  ),
                  ExTextField(
                    id: "price",
                    label: "Price",
                    keyboardType: TextInputType.number,
                    value: item == null ? null : item!["price"],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
