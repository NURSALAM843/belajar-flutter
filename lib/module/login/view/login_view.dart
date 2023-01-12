import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //body
                  const ExTextField(
                    id: "email",
                    label: "Email",
                    value: "admin@example.com",
                  ),
                  const ExTextField(
                    id: "password",
                    label: "Password",
                    textFieldType: TextFieldType.password,
                    value: "123456",
                  ),
                  ExButton(
                    label: "Login",
                    color: Colors.blue,
                    onPressed: () => Get.offAll(const MainNavigationView()),
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
