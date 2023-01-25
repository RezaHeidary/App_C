import 'package:appd/add/add_controller.dart';
import 'package:appd/editor/editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

class AddWidget {
  AddWidget._();

  static AddController addController = Get.put(AddController());

//widget add title text
  static widgetRowForTitle() {
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
  static showDialog() {
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
  static widgetColumnForAddBody() {
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
        Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: HtmlWidget(
              addController.body.value,
              enableCaching: true,
              onLoadingBuilder: ((context, element, loadingProgress) =>
                  CircularProgressIndicator()),
            ),
          ),
        )
      ],
    );
  }

  //widget change button
  static widgetChangeButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        (Icons.edit),
      ),
      backgroundColor: Colors.pink,
    );
  }
}
