import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_view.dart';
import 'edit_widget.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  EditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: EditWidget.widgetAppBar("appEdit".tr),
      body: EditView(
        index: Get.arguments,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EditWidget.widgetDeleteButton(Get.arguments),
            EditWidget.widgetPutButton(Get.arguments),
          ],
        ),
      ),
    );
  }
}
