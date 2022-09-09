import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../src/models/billingInformation.dart';

part 'user.g.dart';

enum Locale {
  DE,
  EN,
  PL
}

class User extends Equatable{
  const User( {
    required this.id,
    required this.name,
    required this.billingInformation,
    required this.locale,
    required this.email,
    required this.welcomeScreenData1,
    required this.welcomeScreenData2,
    required this.welcomeScreenData3,
    required this.creationDate,
    required this.purchaseToken,
    required this.hasPremium,
    required this.originalTransactionId,
    required this.subscriptionExpirationDate,
    required this.modifiedDate,
  });
  final String id;
  final String name;
  final BillingInformation billingInformation;
  final Locale locale;
  final String email;
  final bool welcomeScreenData1;
  final bool welcomeScreenData2;
  final bool welcomeScreenData3;
  final List<String>? purchaseToken;
  final bool hasPremium;
  final DateTime creationDate;
  final DateTime modifiedDate;
  final String? originalTransactionId;
  final DateTime subscriptionExpirationDate;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWth({
    String? id,
    String? name,
    BillingInformation? billingInformation,
    Locale? locale,
    String? email,
    bool? welcomeScreenData1,
    bool? welcomeScreenData2,
    bool? welcomeScreenData3,
    List<String>? purchaseToken,
    bool? hasPremium,
    DateTime? creationDate,
    DateTime? modifiedDate,
    String? originalTransactionId,
    DateTime? subscriptionExpirationDate
  }){
    return User(
        modifiedDate: modifiedDate ?? this.modifiedDate,
        creationDate: creationDate ?? this.creationDate,
        welcomeScreenData1: welcomeScreenData1 ?? this.welcomeScreenData1 ,
        hasPremium: hasPremium ?? this.hasPremium ,
        locale: locale ?? this.locale ,
        subscriptionExpirationDate: subscriptionExpirationDate ?? this.subscriptionExpirationDate ,
        welcomeScreenData3: welcomeScreenData3 ?? this.welcomeScreenData3 ,
        purchaseToken: purchaseToken ?? this.purchaseToken ,
        name: name ?? this.name ,
        billingInformation: billingInformation ?? this.billingInformation ,
        originalTransactionId: originalTransactionId ?? this.originalTransactionId ,
        email: email ?? this.email ,
        welcomeScreenData2: welcomeScreenData2 ?? this.welcomeScreenData2,
        id: id ?? this.id
    );
  }

  @override
  List<Object?> get props => [billingInformation, originalTransactionId, email, welcomeScreenData2, welcomeScreenData3, welcomeScreenData1, hasPremium, locale, subscriptionExpirationDate, purchaseToken, name, creationDate, modifiedDate];
}
