
part of 'item_cubit.dart';
enum ItemStatus { initial, loading, success, failure}

extension ItemStatusX on ItemStatus {
  bool get isInitial => this == ItemStatus.initial;
  bool get isLoading => this == ItemStatus.loading;
  bool get isSuccess => this == ItemStatus.success;
  bool get isFailure => this == ItemStatus.failure;
}

@JsonSerializable()
class ItemState extends Equatable{
  final ItemStatus itemStatus;
  final List<Item> itemList;
  final Item? item;
  const ItemState({this.item, required this.itemList, this.itemStatus = ItemStatus.initial,
});

  ItemState copyWith({
    List<Item>? itemList,
    ItemStatus? itemStatus,
    Item? item
  }){
   return ItemState(
     itemList: itemList ?? this.itemList,
     itemStatus: itemStatus ?? this.itemStatus,
     item: item ?? this.item
   );
  }
  factory ItemState.fromJson(Map<String, dynamic> json) =>
      _$ItemStateFromJson(json);
  Map<String, dynamic> toJson() => _$ItemStateToJson(this);

  @override
  List<Object?> get props => [itemStatus, item, itemList];
}