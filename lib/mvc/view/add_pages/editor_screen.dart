import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../constant.dart';

// ignore: must_be_immutable
class EditorScreen extends StatelessWidget {
  EditorScreen({Key? key}) : super(key: key);

  final HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: Constant.widgetAppBar("Writing/Editing"),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HtmlEditor(
              htmlToolbarOptions:
                  HtmlToolbarOptions(textStyle: TextStyle(color: Colors.black)),
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                  hint: "میتونی مقاله‌تو اینجا بنویسی...",
                  shouldEnsureVisible: true,
                  initialText:
                      " manageArticleController.articleInfoModel.value.content!"),
              callbacks: Callbacks(
                onChangeContent: (p0) {},
              ),
            )
          ],
        )),
      ),
    );
  }
}
