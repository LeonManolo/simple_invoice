import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:invoice_api/invoice_api.dart';

/// Exception thrown when locationSearch fails.
class UserIdRequestFailure implements Exception {
  String message;
  UserIdRequestFailure(this.message);
}


class UserApiClient {
  UserApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  // If you want to test it locally, then the _baseUrl is = 'localhost:5001' for example
  // otherwise for deployment its us-central1-invoice-c63dc.cloudfunctions.net
  // also if you doing it locally, change the Uri.https to http if needed.
  // the path looks like this then: '/invoice-c63dc/us-central1/ms_bl_objects/v1/bl_objects/user
  // when deploying its simply 'api/v1/bl_objects/user'
  // dont forget to adjust http correctly
  static const _baseUrl = 'us-central1-invoice-c63dc.cloudfunctions.net';
  final http.Client _httpClient;

  /**
   * Deletes an [User] by ID.
   */
  deleteUser(String id) async {
    final userRequest = Uri.https(
      _baseUrl,
      '/api/v1/bl_objects/user/$id',
    );
    final userResponse = await _httpClient.delete(userRequest);
    if (userResponse.statusCode != 200) {
      throw Exception(userResponse.body);
    }

    final userJson = jsonDecode(
        userResponse.body
    );

    if(userJson["deletedCount"] != 1){
      throw new Exception('No users deleted');
    }
  }

  /**
   * Fetches an [User] by ID.
   */
  dynamic getUserById(String id) async {

    final userRequest = Uri.https(
      _baseUrl,
        '/api/v1/bl_objects/user/$id',
    );
    final userResponse = await _httpClient.get(userRequest);

    print(userResponse.body);
    if (userResponse.statusCode != 200) {
      throw UserIdRequestFailure(userResponse.body.toString());
    }

    final userJson = jsonDecode(
      userResponse.body
    );
    print(userJson);

    if(userJson == {}){
      throw new Exception('No users found');
    }

    try{
    User user = User.fromJson(userJson as Map<String, dynamic>);
    return user;
  }catch(e){
    print(e.toString());
    }}

  /**
   * Queries the DB for users.
   */
  dynamic getUsers(Map<String, String> query) async {
    jsonEncode(query);
    final userRequest = Uri.https(
      _baseUrl,
      '/api/v1/bl_objects/user',
      query
    );
    final userResponse = await _httpClient.get(userRequest);
    if (userResponse.statusCode != 200) {
      throw new Exception(userResponse.body);
    }

    final userJson = jsonDecode(
        userResponse.body
    );
    if(userJson["data"].isEmpty){
      throw new Exception('No users found');
    }
    try{
      List<User> userList = List<User>.from(userJson["data"].map((user) => User.fromJson(user)).toList());
      return {"userList": userList, "lastN": userJson["lastN"]};
    }catch(e){
      print(e.toString());
    }}

  /**
   * Inserts the [User] into the DB.
   */
  insertUser(User user) async {
    final userRequest = Uri.https(
      _baseUrl,
      '/api/v1/bl_objects/user',
    );
    String userJson = jsonEncode(user.toJson());
    final userResponse = await _httpClient.put(userRequest, body: userJson, headers: {"Content-Type":"application/json"});
    print(userResponse.body);
    if (userResponse.statusCode != 201) {
      throw Exception(userResponse.body);
    }
    final decodedResponse = jsonDecode(
        userResponse.body
    );
    return decodedResponse ["upsertedId"];

  }

  /**
   * Inserts the [User] into the DB.
   */
  updateUser(User user) async {
    final userRequest = Uri.https(
      _baseUrl,
      '/api/v1/bl_objects/user',
    );
    String userJson = jsonEncode(user.toJson());
    final userResponse = await _httpClient.put(userRequest, body: userJson, headers: {"Content-Type":"application/json"});
    if (userResponse.statusCode != 200) {
      throw Exception(userResponse.body);
    }

    final responseJson = jsonDecode(
        userResponse.body
    );
    final bool updated = responseJson["modifiedCount"] == 1;
    if(!updated){
      throw new Exception('No users updated');
    }
  }
}
