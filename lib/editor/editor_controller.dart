import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class EidtorController extends GetxController {
  final Rx<HtmlEditorController> htmlController = HtmlEditorController().obs;
  var body = "Add Body".obs;
}
