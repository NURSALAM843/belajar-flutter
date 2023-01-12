import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginFormController>(
      init: LoginFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.lightGreenAccent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //body
                    const SizedBox(
                      height: 40.0,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const ExTextField(
                              id: "email",
                              label: "Email",
                              value: "admin@gmail.com",
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
                              onPressed: () => controller.doLogin(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
