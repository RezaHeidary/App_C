import 'package:appd/editor/editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../add/add_widget.dart';

class EditorWidget {
  EditorWidget._();
  static EidtorController eidtorController = Get.put(EidtorController());
  //widget HtmlEditor
  static widgetHtmlEditor() {
    return Column(
      children: [
        HtmlEditor(
          htmlToolbarOptions:
              HtmlToolbarOptions(textStyle: TextStyle(color: Colors.black)),
          controller: eidtorController.htmlController.value,
          htmlEditorOptions: HtmlEditorOptions(
            hint: "write here...",
            shouldEnsureVisible: true,
          ),
          callbacks: Callbacks(
            onChangeContent: (p0) {
              AddWidget.addController.body.value = p0!;
            },
          ),
        )
      ],
    );
  }
}
