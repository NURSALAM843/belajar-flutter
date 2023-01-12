import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class TutorialStateManagementView extends StatelessWidget {
  const TutorialStateManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TutorialStateManagementController>(
      init: TutorialStateManagementController(),
      builder: (controller) {
        controller.view = this;

        if (controller.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Tutorial State Management"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
              ),
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.green[200],
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //body
                  // Text("${controller.counter}"),
                  // ExButton(
                  //   label: "Add",
                  //   color: primaryColor,
                  //   onPressed: () {
                  //     controller.counter++;
                  //     print(controller.counter);
                  //     controller.update();
                  //   },
                  // ),
                  // ExButton(
                  //   label: "Min",
                  //   color: primaryColor,
                  //   onPressed: () {
                  //     controller.counter--;
                  //     print(controller.counter);
                  //     controller.update();
                  //   },
                  // ),
                  // ExButton(
                  //   label: "Loading",
                  //   color: primaryColor,
                  //   onPressed: () async {
                  //     controller.loading = true;
                  //     controller.update();

                  //     await Future.delayed(const Duration(seconds: 3));

                  //     controller.loading = false;
                  //     controller.update();
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // const BasicCounter(),

                  //list_people

                  ListView.builder(
                    itemCount: controller.peoples.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = controller.peoples[index];
                      return InkWell(
                        onTap: () {
                          // controller.peoples.removeAt(index);
                          // controller.update();
                          controller.selectedIndex = index;
                          Get.to(const TutorialConfirmView());
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(
                                item["photo"],
                              ),
                            ),
                            title: Text(item["name"]),
                            subtitle: Text(item["job"]),
                          ),
                        ),
                      );
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
