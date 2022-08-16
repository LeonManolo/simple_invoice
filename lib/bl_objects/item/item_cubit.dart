import 'package:equatable/equatable.dart';
import 'package:easyinvoice/src/models/item.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:item_repository/item_repository.dart'
    show ItemRepository;

part 'item_cubit.g.dart';
part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit(this._itemRepository): super(const ItemState(itemList: []));

  final ItemRepository _itemRepository;

  Future<void> fetchItem(String? id) async {
    if (id == null || id.isEmpty) return;

    emit(state.copyWith(itemStatus: ItemStatus.loading));

    try {
      final item = Item.oneFromRepository(
        await _itemRepository.getItem(id),
      );
      emit(
        state.copyWith(
          itemStatus: ItemStatus.success,
          item: item,
        ),
      );
    } on Exception {
      emit(state.copyWith(itemStatus: ItemStatus.failure));
    }
  }

  Future<void> deleteItem(String? id) async {
    if (id == null || id.isEmpty) return;

    emit(state.copyWith(itemStatus: ItemStatus.loading));

    try {
      await _itemRepository.deleteItem(id);

      emit(
        state.copyWith(
          itemStatus: ItemStatus.success,
        ),
      );
    } on Exception {
      emit(state.copyWith(itemStatus: ItemStatus.failure));
    }
  }

  Future<void> fetchItems({Map<String, dynamic>? query = const {}}) async {
    if (query == null) return;

    emit(state.copyWith(itemStatus: ItemStatus.loading));

    try {
      final items = Item.multipleFromRepository(
        await _itemRepository.getItems(query),
      );
      emit(
        state.copyWith(
          itemStatus: ItemStatus.success,
          item: null,
          itemList: items
        ),
      );
    } on Exception {
      emit(state.copyWith(itemStatus: ItemStatus.failure));
    }
  }

  @override
  ItemState fromJson(Map<String, dynamic> json) =>
      ItemState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ItemState state) => state.toJson();
}

// wie pagination am besten