import 'package:appd/editor/editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class EditorWidget {
  EditorWidget._();
  static EidtorController eidtorController = Get.put(EidtorController());
  //widget HtmlEditor
  static widgetHtmlEditor(str) {
    return Column(
      children: [
        HtmlEditor(
          htmlToolbarOptions:
              HtmlToolbarOptions(textStyle: TextStyle(color: Colors.black)),
          controller: eidtorController.htmlController.value,
          htmlEditorOptions: HtmlEditorOptions(
            hint: "write here...",
            initialText: str,
            shouldEnsureVisible: true,
          ),
          callbacks: Callbacks(
            onChangeContent: (p0) {
              eidtorController.body.value = p0!;
            },
          ),
        )
      ],
    );
  }
}
