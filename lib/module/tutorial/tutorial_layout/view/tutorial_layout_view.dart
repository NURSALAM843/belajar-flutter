import 'package:flutter/material.dart';
import '../controller/tutorial_layout_controller.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class TutorialLayoutView extends StatelessWidget {
  const TutorialLayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TutorialLayoutController>(
      init: TutorialLayoutController(),
      builder: (controller) {
        controller.view = this;
        /*
        column,row,stack,wrap
        expanded,spacer,singlechildscrollview
        */

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Tutorial Layout"),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(const TutorialNavigasiView());
                },
                icon: const Icon(
                  Icons.handshake,
                  size: 24.0,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //body
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: 150.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              top: 10.0,
                              child: Container(
                                width: 70.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      Container(
                        width: 90.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: const Center(child: Text("categori 1")),
                      ),
                      Container(
                        width: 90.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: const Center(child: Text("categori 1")),
                      ),
                      Container(
                        width: 90.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: const Center(child: Text("categori 1")),
                      ),
                      Container(
                        width: 90.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: const Center(child: Text("categori 1")),
                      ),
                    ],
                  ),
                  LayoutBuilder(
                    builder: (context, constraint) {
                      List menus = [
                        {
                          "icon": Icons.abc,
                          "label": "Home",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.tiktok,
                          "label": "Tiktok",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.facebook,
                          "label": "Facebook",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.access_alarm,
                          "label": "Task",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.developer_board,
                          "label": "Developer",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.web,
                          "label": "Website",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.mobile_screen_share_rounded,
                          "label": "Share",
                          "onTap": () {},
                        },
                        {
                          "icon": Icons.event,
                          "label": "Event",
                          "onTap": () {},
                        },
                      ];

                      return Wrap(
                        children: List.generate(
                          menus.length,
                          (index) {
                            var item = menus[index];

                            var size = constraint.biggest.width / 4;

                            return SizedBox(
                              width: size,
                              height: size,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blueGrey,
                                  animationDuration:
                                      const Duration(milliseconds: 1000),
                                  backgroundColor: Colors.transparent,
                                  splashFactory: InkSplash.splashFactory,
                                  shadowColor: Colors.transparent,
                                  elevation: 0.0,
                                ),
                                onPressed: () => item["onTap"](),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      item["icon"],
                                      color: Colors.blueGrey,
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      "${item["label"]}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 8.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          color: Colors.red,
                        ),
                        const Spacer(),
                        Container(
                          width: 100.0,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 100.0,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          color: Colors.red,
                        ),
                        Expanded(
                          child: Container(
                            width: 100.0,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.amber[100],
                    height: 100.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("hallo"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("halo"),
                      const Text(
                        "text",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 100.0,
                        color: Colors.red,
                      ),
                      Container(
                        height: 100.0,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 100.0,
                        color: Colors.purple,
                      ),
                    ],
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
