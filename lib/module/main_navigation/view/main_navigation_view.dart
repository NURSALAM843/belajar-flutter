import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      init: MainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Column(
            children: [
              //body
              SizedBox(
                height: 100.0,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.selectedIndex = 0;
                          controller.update();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          color: controller.selectedIndex == 0
                              ? Colors.green[300]
                              : Colors.white,
                          child: const Text("Dashboard"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.selectedIndex = 1;
                          controller.update();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          color: controller.selectedIndex == 1
                              ? Colors.blue[300]
                              : Colors.white,
                          child: const Text("Favorite"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.selectedIndex = 2;
                          controller.update();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          color: controller.selectedIndex == 2
                              ? Colors.red[300]
                              : Colors.white,
                          child: const Text("Profile"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: IndexedStack(
                    index: controller.selectedIndex,
                    children: const [
                      DashboardView(),
                      FavoriteView(),
                      ProfileView()
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
