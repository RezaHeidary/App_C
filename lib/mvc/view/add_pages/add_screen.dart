import 'package:appd/mvc/constant.dart';
import 'package:appd/mvc/controller/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'editor_screen.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  AddController addController = Get.put(AddController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Constant.widgetAppBar("Add"),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          widgetRowForTitle(),
          const SizedBox(
            height: 80,
          ),
          widgetRowForAddBody(),
        ],
      ),
    );
  }

//widget add title text
  widgetRowForTitle() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.edit_note,
              size: 30,
            ),
            onPressed: () {
              showDialog();
            },
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            addController.title.value,
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }

  //set title from modal
  showDialog() {
    return Get.defaultDialog(
        title: "Insert a title",
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: addController.textEditingController.value,
            decoration: InputDecoration(hintText: "new title"),
            style: TextStyle(fontSize: 20),
          ),
        ),
        confirm: TextButton(
            onPressed: () {
              addController.getTitle();
            },
            child: Text("Add")));
  }

  //widget add body text
  widgetRowForAddBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.edit_note,
            size: 30,
          ),
          onPressed: () {
            Get.to(EditorScreen());
          },
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Add Body",
          style: TextStyle(fontSize: 25),
        )
      ],
    );
  }
}
