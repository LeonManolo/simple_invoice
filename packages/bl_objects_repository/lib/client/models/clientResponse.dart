import 'package:equatable/equatable.dart';
import 'package:invoice_api/invoice_api.dart';

class ClientResponse extends Equatable {
  final List<Client> clientList;
  final int lastN;
  ClientResponse({required this.clientList, required this.lastN});

  @override
  List<Object?> get props => [clientList, lastN];
}