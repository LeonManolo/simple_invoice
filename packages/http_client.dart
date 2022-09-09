import 'package:http/http.dart' as http;

// So, I did not want to create a new http client for each microservice since we are communicating with the
// server each time and I figured a acceptable way of sharing an instance would
// be making it static
class HttpClient {
  static final http.Client httpClient = http.Client();
}