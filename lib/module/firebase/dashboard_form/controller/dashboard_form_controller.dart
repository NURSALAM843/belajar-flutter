import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';
import '../view/dashboard_form_view.dart';

class DashboardFormController extends GetxController {
  DashboardFormView? view;

  doLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginFormView());
  }
}
