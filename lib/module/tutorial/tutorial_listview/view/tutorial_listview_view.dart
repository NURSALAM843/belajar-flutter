import 'package:flutter/material.dart';
import '../controller/tutorial_listview_controller.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class TutorialListviewView extends StatelessWidget {
  const TutorialListviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TutorialListviewController>(
      init: TutorialListviewController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text("Tutorial Listview"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //body
                  Container(
                    height: 100.0,
                    width: 140,
                    color: Colors.red,
                  ),
                  ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = {};
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            backgroundImage: const NetworkImage(
                              "https://i.ibb.co/QrTHd59/woman.jpg",
                            ),
                          ),
                          title: const Text("Jessica Doe"),
                          subtitle: const Text("Programmer"),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100.0,
                        color: Colors.blue,
                        margin: const EdgeInsets.only(bottom: 10.0),
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
