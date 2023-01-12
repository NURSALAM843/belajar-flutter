import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class DemoFormView extends StatelessWidget {
  const DemoFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoFormController>(
      init: DemoFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Demo Form"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //body
                  const ExRating(
                    id: "rating",
                    label: "Rating",
                    value: null,
                  ),
                  const ExLocationPicker(
                    id: "location",
                    label: "Location",
                    latitude: -6.218481065235333,
                    longitude: 106.80254435779423,
                  ),
                  const ExTextField(
                    id: "first_name",
                    label: "First Name",
                    value: null,
                  ),
                  const ExTextField(
                    id: "password",
                    label: "Password",
                    textFieldType: TextFieldType.password,
                    value: null,
                  ),
                  const ExCombo(
                    id: "gender",
                    label: "Gender",
                    items: [
                      {
                        "label": "Male",
                        "value": "Male",
                      },
                      {
                        "label": "Female",
                        "value": "Female",
                      }
                    ],
                    value: "Female",
                  ),
                  const ExSwitch(
                    id: "gender",
                    label: "Gender",
                    value: true,
                  ),
                  const ExRadio(
                    id: "gender",
                    label: "Gender",
                    items: [
                      {
                        "label": "Male",
                        "value": "Male",
                      },
                      {
                        "label": "Female",
                        "value": "Female",
                      }
                    ],
                    value: "Female",
                  ),
                  ExButton(
                    label: "Save",
                    color: primaryColor,
                    onPressed: () {},
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
