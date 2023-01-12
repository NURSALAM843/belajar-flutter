import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class ProductFormController extends GetxController {
  ProductFormView? view;

  doSave() async {
    var photo = Input.get("photo");
    var productName = Input.get("product_name");
    var price = Input.get("price");

    if (view!.item == null) {
      await FirebaseFirestore.instance.collection("products").add({
        "photo": photo,
        "product_name": productName,
        "price": price,
      });
    } else {
      await FirebaseFirestore.instance
          .collection("products")
          .doc(view!.item!["id"])
          .update({
        "photo": photo,
        "product_name": productName,
        "price": price,
      });
    }
    Get.back();
  }
}
