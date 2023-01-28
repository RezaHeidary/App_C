import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'appHome': 'Home',
          'appAdd': 'Add',
          'titleText': 'Add Title',
          'bodyText': 'Add Body',
          'insertTitle': 'Insert Title',
          'newtitle': 'New Title'
        },
        'fa_IR': {
          'appHome': 'خانه',
          'appAdd': 'افزودن',
          'titleText': 'موضوع',
          'bodyText': 'افزودن متن',
          'insertTitle': 'موضوع ',
          'newtitle': 'بدنه'
        }
      };
}
