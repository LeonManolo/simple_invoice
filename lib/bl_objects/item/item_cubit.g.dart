// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemState _$ItemStateFromJson(Map<String, dynamic> json) => ItemState(
      item: json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
      itemList: (json['itemList'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemStatus:
          $enumDecodeNullable(_$ItemStatusEnumMap, json['itemStatus']) ??
              ItemStatus.initial,
    );

Map<String, dynamic> _$ItemStateToJson(ItemState instance) => <String, dynamic>{
      'itemStatus': _$ItemStatusEnumMap[instance.itemStatus]!,
      'itemList': instance.itemList,
      'item': instance.item,
    };

const _$ItemStatusEnumMap = {
  ItemStatus.initial: 'initial',
  ItemStatus.loading: 'loading',
  ItemStatus.success: 'success',
  ItemStatus.failure: 'failure',
};
