import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  var title = "Title Text".obs;

  getTitle() {
    if (textEditingController.value.text.isNotEmpty) {
      title.value = textEditingController.value.text;
      Get.back();
    }
  }
}
