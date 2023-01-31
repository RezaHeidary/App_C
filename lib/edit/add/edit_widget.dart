import 'package:appd/controller/api_controller.dart';
import 'package:appd/edit/add/controller/api_controller.dart';
import 'package:appd/edit/add/controller/edit_controller.dart';
import 'package:appd/editor/editor_controller.dart';
import 'package:appd/editor/editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

class EditWidget {
  EditWidget._();

  static EditController editController = Get.put(EditController());
  static EidtorController eidtorController = Get.put(EidtorController());
  static EditApiController editApiController = Get.put(EditApiController());
  static ApiController apiController = Get.put(ApiController());
  static var flag = true.obs;
  //widget add title text
  static widgetRowForTitle(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.edit_note,
            size: 30,
          ),
          onPressed: () {
            showDialog(index);
          },
        ),
        SizedBox(
          width: 14,
        ),
        Text(
          editController.title.value == "Add title"
              ? editController.apiController.homeModleList[index].title!
              : editController.title.value,
          style: TextStyle(fontSize: 25),
        )
      ],
    );
  }

  //set title from modal
  static showDialog(index) {
    return Get.defaultDialog(
        title: "insertTitle".tr,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: editController.textEditingController.value,
            decoration: InputDecoration(hintText: "newtitle".tr),
            style: TextStyle(fontSize: 20),
          ),
        ),
        confirm: TextButton(
            onPressed: () {
              editController.getTitle(index);
            },
            child: Text("Add")));
  }

  //widget add body text
  static widgetColumnForAddBody(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.edit_note,
            size: 30,
          ),
          onPressed: () {
            Get.to(EditorScreen(),
                arguments: editController
                    .apiController.homeModleList[index].body
                    .toString());
          },
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlWidget(
            eidtorController.body.value == "Add Body"
                ? editController.apiController.homeModleList[index].body
                    .toString()
                : eidtorController.body.value,
            enableCaching: true,
            onLoadingBuilder: ((context, element, loadingProgress) =>
                CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }

  //widget change button
  static widgetPutButton(index) {
    return ElevatedButton(
      onPressed: () {
        Get.snackbar(
          "Update",
          "",
        );
        editApiController.getAddPut(index);
      },
      child: Icon(
        (Icons.edit),
      ),
    );
  }

  static widgetDeleteButton(index) {
    return ElevatedButton(
      onPressed: () {
        Get.snackbar("Delete", "");
        editApiController.getDelete(index);
        apiController.getList();
        flag.value = false;
      },
      child: Icon(
        (Icons.delete),
      ),
    );
  }

  static widgetAppBar(str) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (flag.value) {
            apiController.getList();
            print("object");
          }
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      centerTitle: true,
      title: Text(
        str,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
