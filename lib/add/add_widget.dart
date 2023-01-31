import 'package:appd/add/controller/add_api_controller.dart';
import 'package:appd/add/controller/add_controller.dart';
import 'package:appd/controller/api_controller.dart';
import 'package:appd/editor/editor_controller.dart';
import 'package:appd/editor/editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

class AddWidget {
  AddWidget._();

  static AddController addController = Get.put(AddController());
  static EidtorController eidtorController = Get.put(EidtorController());
  static AddApiController addApiController = Get.put(AddApiController());
  static ApiController apiController = Get.put(ApiController());

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
        title: "insertTitle".tr,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: addController.textEditingController.value,
            decoration: InputDecoration(hintText: "newtitle".tr),
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
              eidtorController.body.value,
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
      onPressed: () async {
        Get.snackbar("Add", "");
        await addApiController.getAddPost();
      },
      child: Icon(
        (Icons.edit),
      ),
    );
  }

  static widgetAppBar(str) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          apiController.getList();

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
