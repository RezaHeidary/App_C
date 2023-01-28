import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnection {
  InternetConnection._();

  static Future<bool> serviesInternetConnectionChecker() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! Free cute dog pics!');
    } else {
      print('No internet :( Reason:');
    }
    return result;
  }
}
