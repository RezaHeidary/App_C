import 'package:appd/controller/api_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  ApiController apiController = Get.put(ApiController());
  var title = "Add title".obs;
  getTitle(index) {
    if (textEditingController.value.text.isNotEmpty) {
      title.value = textEditingController.value.text;
      Get.back();
    }
  }
}
