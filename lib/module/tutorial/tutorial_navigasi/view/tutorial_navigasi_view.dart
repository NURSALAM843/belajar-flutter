import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class TutorialNavigasiView extends StatelessWidget {
  const TutorialNavigasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TutorialNavigasiController>(
      init: TutorialNavigasiController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[500],
            title: const Text("Tutorial Navigasi"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.to(const TutorialLayoutView());
                    },
                    icon: const Icon(Icons.map),
                    label: const Text("klik"),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(const TutorialCommonWidget2View());
                    },
                    icon: const Icon(
                      Icons.help,
                      size: 24.0,
                      color: Colors.red,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const TutorialCommonWidgetView());
                    },
                    child: const Text("klik klik"),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const TutorialCommonWidget2View());
                    },
                    child: Container(
                      height: 100.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.ibb.co/3pPYd14/freeban.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraint) {
                      List menus = [
                        {
                          "icon": Icons.abc,
                          "label": "Home",
                          "onTap": () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TutorialCommonWidget2View()),
                            );
                          },
                        },
                        {
                          "icon": Icons.tiktok,
                          "label": "Tiktok",
                          "onTap": () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TutorialCommonWidget2View()),
                            );
                          },
                        },
                        {
                          "icon": Icons.facebook,
                          "label": "Facebook",
                          "onTap": () {
                            Get.to(const TutorialLayoutView());
                          },
                        },
                        {
                          "icon": Icons.access_alarm,
                          "label": "Task",
                          "onTap": () {
                            Get.offAll(const TutorialLayoutView());
                          },
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
