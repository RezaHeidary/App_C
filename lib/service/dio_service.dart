import 'package:http/http.dart' as http;

class DioService {
  Future<dynamic> getMethod(String url) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);
    return response;
  }
}
