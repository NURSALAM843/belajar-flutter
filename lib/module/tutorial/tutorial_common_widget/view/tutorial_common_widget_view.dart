import 'package:flutter/material.dart';
import '../controller/tutorial_common_widget_controller.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class TutorialCommonWidgetView extends StatelessWidget {
  const TutorialCommonWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TutorialCommonWidgetController>(
      init: TutorialCommonWidgetController(),
      builder: (controller) {
        controller.view = this;
        return Scaffold(
          appBar: AppBar(
            elevation: 10.0,
            backgroundColor: Colors.red,
            title: const Text("Tutorial Common Widget"),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications))
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.green[200],
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "Hello Salam",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/icon/icon.png"),
                    ),
                    title: Text("Prindavan"),
                    subtitle: Text("250 USD"),
                    trailing: Icon(Icons.add),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 7),
                        ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/S32HNjD/no-image.jpg"))),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Hello"),
                ),
                const Icon(
                  Icons.home,
                  size: 50.0,
                  color: Colors.green,
                ),
                const Icon(Icons.favorite),
                Image.asset(
                  "assets/icon/icon.png",
                  width: 100.0,
                  height: 100.0,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 70.0,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
