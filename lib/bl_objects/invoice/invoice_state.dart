
part of 'client_cubit.dart';

abstract class ClientState extends Equatable {
  const ClientState();

  @override
  List<Object?> get props => [];
}

class InitialState extends ClientState {}

class LoadingState extends ClientState {}

class ClientDeletedState extends ClientState {}

class ClientUpdatedState extends ClientState {}

class NoMoreResultsState extends ClientState {}

@JsonSerializable()
class ClientCreatedState extends ClientState{

  final String id;
  const ClientCreatedState({required this.id});

  factory ClientCreatedState.fromJson(Map<String, dynamic> json) =>
      _$ClientCreatedStateFromJson(json);

  Map<String, dynamic> toJson() => _$ClientCreatedStateToJson(this);
}

@JsonSerializable()
class ClientFetchedState extends ClientState {
  final Client client;
  const ClientFetchedState({required this.client});

  factory ClientFetchedState.fromJson(Map<String, dynamic> json) =>
      _$ClientFetchedStateFromJson(json);

  Map<String, dynamic> toJson() => _$ClientFetchedStateToJson(this);

  @override
  List<Object?> get props => [client];
}

@JsonSerializable()
class ClientListFetchedState extends ClientState {
  final int lastN;
  final List<Client> clientList;
  const ClientListFetchedState({required this.clientList, required this.lastN});

  factory ClientListFetchedState.fromJson(Map<String, dynamic> json) =>
      _$ClientListFetchedStateFromJson(json);

  Map<String, dynamic> toJson() => _$ClientListFetchedStateToJson(this);

  @override
  List<Object?> get props => [clientList];
}

@JsonSerializable()
class FailureState extends ClientState {
  final String errorMessage;
  const FailureState({required this.errorMessage});

  factory FailureState.fromJson(Map<String, dynamic> json) =>
      _$FailureStateFromJson(json);

  Map<String, dynamic> toJson() => _$FailureStateToJson(this);
}

