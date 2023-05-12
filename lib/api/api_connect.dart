import 'package:http/http.dart' as http;

const baseUrl = "http://localhost:3000/api/monitor/get";

class API {
  // comunicação assincrona
  static Future getMonitores() {
    var url = baseUrl;
    return http.get(Uri.parse(url));
  }
}
