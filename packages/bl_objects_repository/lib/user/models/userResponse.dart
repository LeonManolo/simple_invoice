import 'package:equatable/equatable.dart';
import 'package:invoice_api/invoice_api.dart';

class UserResponse extends Equatable {
  final List<User> userList;
  final int lastN;
  UserResponse({required this.userList, required this.lastN});

  @override
  List<Object?> get props => [userList, lastN];
}