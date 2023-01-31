import 'package:appd/edit/add/edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EditView extends StatelessWidget {
  EditView({super.key, required this.index});
  var index;
  var isNull = 0.obs;
  @override
  Widget build(BuildContext context) {
    isNull.value = index;
    return Obx(() => EditWidget.apiController.homeModleList.isNotEmpty
        ? Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              EditWidget.widgetRowForTitle(index),
              const SizedBox(
                height: 80,
              ),
              EditWidget.widgetColumnForAddBody(index),
            ],
          )
        : Center(child: Text("Deleted")));
  }
}
