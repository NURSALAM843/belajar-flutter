import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';
import '../view/login_form_view.dart';

class LoginFormController extends GetxController {
  LoginFormView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  doLogin() async {
    var email = Input.get("email");
    var password = Input.get("password");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(const DashboardFormView());
    } on Exception catch (err) {
      print(err);
    }
  }
}
