
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/client.dart';

class ClientsApiClient{
  final http.Client _httpClient;




  ClientsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'www.blabla.com';

  /// Finds a [Client] `/api/client?id=(id)`.
  Future<Client> getClient(String id) async {
    final request = Uri.https(
      _baseUrl,
      '/api/client',
      <String, String>{'id': id},
    );
    final response = await _httpClient.get(request);

    /*
    if (response.statusCode != 200) {
      throw LocationIdRequestFailure();
    }
    */


    final json = jsonDecode(
      response.body,
    ) as List;

    /*
    if (json.isEmpty) {
      throw LocationNotFoundFailure();
    }
    */

    return Client.fromJson(json.first as Map<String, dynamic>);
  }
}