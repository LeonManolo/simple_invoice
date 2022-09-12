import 'dart:async';

import 'package:invoice_api/invoice_api.dart';

import 'models/userResponse.dart';

class UserFailure implements Exception {}

class UserRepository {
  UserRepository({UserApiClient? userApiClient})
      : _userApiClient = userApiClient ?? UserApiClient();

  final UserApiClient _userApiClient;

  Future<User> getUser(String id) async{
    User user = await _userApiClient.getUserById(id);
    return user;
  }

  Future<UserResponse> getUsers(Map<String, String> query) async{
    Map<String, dynamic> responseMap = await _userApiClient.getUsers(query);
    UserResponse userResponse = UserResponse(userList: responseMap["userList"], lastN: responseMap["lastN"]);
    return userResponse;
  }

  deleteUser(String id) async{
    await _userApiClient.deleteUser(id);
  }

  Future<String> insertUser(User user) async{
    String insertedId = await _userApiClient.insertUser(user);
    return insertedId;
  }

  updateUser(User user) async{
    await _userApiClient.updateUser(user);
  }
}