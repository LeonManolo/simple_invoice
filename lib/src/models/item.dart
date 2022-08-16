import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:invoice_api/invoice_api.dart' as invoice_api;
part 'item.g.dart';
@JsonSerializable()
class Item extends Equatable{
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

  @override
  List<Object> get props => [userId, id, title, pricePerUnit, description,
    tax, discount, taxIncluded, creationDate, modifiedDate, taxedAmount];


  Item copyWith({
    String? userId,
    String? id,
    String? title,
    double? pricePerUnit,
    String? description,
    double? tax,
    double? discount,
    bool? taxIncluded,
    DateTime? creationDate,
    DateTime? modifiedDate,
    double? taxedAmount,
  }) {
    return Item(
      userId : userId ?? this.userId,
      id : id ?? this.id,
      title : title ?? this.title,
      pricePerUnit : pricePerUnit ?? this.pricePerUnit,
      description : description ?? this.description,
      tax : tax ?? this.tax,
      discount : discount ?? this.discount,
      taxIncluded : taxIncluded ?? this.taxIncluded,
      creationDate : creationDate ?? this.creationDate,
      modifiedDate : modifiedDate ?? this.modifiedDate,
      taxedAmount : taxedAmount ?? this.taxedAmount,
    );
  }

  factory Item.oneFromRepository(invoice_api.Item item) {
    return Item(
      userId : item.userId,
      id : item.id,
      title : item.title,
      pricePerUnit : item.pricePerUnit,
      description : item.description,
      tax : item.tax,
      discount : item.discount,
      taxIncluded : item.taxIncluded,
      creationDate : item.creationDate,
      modifiedDate : item.modifiedDate,
      taxedAmount : item.taxedAmount
    );
  }
  static List<Item> multipleFromRepository(List<invoice_api.Item> itemList) {

    return itemList.map((item) => Item(
        userId : item.userId,
        id : item.id,
        title : item.title,
        pricePerUnit : item.pricePerUnit,
        description : item.description,
        tax : item.tax,
        discount : item.discount,
        taxIncluded : item.taxIncluded,
        creationDate : item.creationDate,
        modifiedDate : item.modifiedDate,
        taxedAmount : item.taxedAmount
    )).toList();

  }

  static final empty = Item(
      tax: 0,
      discount: 0,
      pricePerUnit: 0,
      userId: '',
      modifiedDate: DateTime.now(),
      description: '',
      taxedAmount: 0,
      id: '',
      title: '',
      taxIncluded: false,
      creationDate: DateTime.now()
  );

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}