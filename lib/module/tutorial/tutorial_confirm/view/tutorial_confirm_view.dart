import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';
import '../../tutorial_state_management/controller/tutorial_state_management_controller.dart';

class TutorialConfirmView extends StatelessWidget {
  const TutorialConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TutorialConfirmController>(
      init: TutorialConfirmController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Tutorial Confirm"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    "Yakin Ingin Menghapus Data Ini!",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ExButton(
                    label: "No",
                    color: disabledColor,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  ExButton(
                    label: "Yes",
                    color: primaryColor,
                    onPressed: () {
                      TutorialStateManagementController
                          tutorialStateManagementController = Get.find();
                      var index =
                          tutorialStateManagementController.selectedIndex;
                      tutorialStateManagementController.peoples.removeAt(index);
                      tutorialStateManagementController.update();
                      Get.back();
                    },
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
