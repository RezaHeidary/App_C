import 'package:appd/editor/editor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

// ignore: must_be_immutable
class EditorScreen extends StatelessWidget {
  EditorScreen({
    Key? key,
  }) : super(key: key);
  final HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => controller.clearFocus(),
        child: EditorView(str: Get.arguments));
  }
}
