import 'package:get/get.dart';
import '../view/tutorial_state_management_view.dart';

class TutorialStateManagementController extends GetxController {
  TutorialStateManagementView? view;
  int counter = 4;
  bool loading = false;
  int selectedIndex = 0;

  List peoples = [
    {
      "name": "Deny",
      "photo": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "job": "Tukang Ketik"
    },
    {
      "name": "Alex",
      "photo": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "job": "UI/UX"
    },
    {
      "name": "Salam",
      "photo": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "job": "Software Enginnering"
    },
    {
      "name": "Gafuk",
      "photo": "https://i.ibb.co/S32HNjD/no-image.jpg",
      "job": "DevOps Enginnering"
    },
  ];
}
