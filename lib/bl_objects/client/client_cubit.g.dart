// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientCreatedState _$ClientCreatedStateFromJson(Map<String, dynamic> json) =>
    ClientCreatedState(
      id: json['id'] as String,
    );

Map<String, dynamic> _$ClientCreatedStateToJson(ClientCreatedState instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ClientFetchedState _$ClientFetchedStateFromJson(Map<String, dynamic> json) =>
    ClientFetchedState(
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientFetchedStateToJson(ClientFetchedState instance) =>
    <String, dynamic>{
      'client': instance.client.toJson(),
    };

ClientListFetchedState _$ClientListFetchedStateFromJson(
        Map<String, dynamic> json) =>
    ClientListFetchedState(
      clientList: (json['clientList'] as List<dynamic>)
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastN: json['lastN'] as int,
    );

Map<String, dynamic> _$ClientListFetchedStateToJson(
        ClientListFetchedState instance) =>
    <String, dynamic>{
      'lastN': instance.lastN,
      'clientList': instance.clientList.map((e) => e.toJson()).toList(),
    };

FailureState _$FailureStateFromJson(Map<String, dynamic> json) => FailureState(
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$FailureStateToJson(FailureState instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
    };
