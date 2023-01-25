import 'package:appd/editor/edittor_widget.dart';
import 'package:flutter/material.dart';
import '../core/constant.dart';

class EditorView extends StatelessWidget {
  const EditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Constant.widgetAppBar("Writing/Editing"),
        body: EditorWidget.widgetHtmlEditor());
  }
}
