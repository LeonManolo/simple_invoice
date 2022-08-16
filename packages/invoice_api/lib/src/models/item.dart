import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  const Item( {
    required this.userId,
    required this.id,
    required this.title,
    required this.pricePerUnit,
    required this.description,
    required this.tax,
    required this.discount,
    required this.taxIncluded,
    required this.creationDate,
    required this.modifiedDate,
    required this.taxedAmount,
});
  final String userId;
  final String id;
  final String title;
  final double pricePerUnit;
  final String description;
  final double tax;
  final double discount;
  final bool taxIncluded;
  final DateTime creationDate;
  final DateTime modifiedDate;
  final double taxedAmount;

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}