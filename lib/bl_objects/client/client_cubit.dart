import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:invoice_api/invoice_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:item_repository/item_repository.dart'
    show ItemRepository, ItemResponse;
part 'item_cubit.g.dart';
part 'item_state.dart';

class ItemCubit extends HydratedCubit<ItemState> {
  ItemCubit(this._itemRepository): super(InitialState());

  final ItemRepository _itemRepository;

  Future<void> updateItem(Item item) async {

    emit(LoadingState());

    try {
      await _itemRepository.updateItem(item);

      emit(ItemUpdatedState());
    } on Exception {
      emit(const FailureState(errorMessage: 'errorMessage'));
    }
  }

  Future<void> fetchItem(String? id) async {
    if (id == null || id.isEmpty) return;

    emit(LoadingState());

    try {
      final item = await _itemRepository.getItem(id);

      emit(ItemFetchedState(item: item));
    } on Exception {
      emit(const FailureState(errorMessage: 'errorMessage'));
    }
  }

  Future<void> deleteItem(String? id) async {
    if (id == null || id.isEmpty) return;

    emit(LoadingState());

    try {
      await _itemRepository.deleteItem(id);
      emit(ItemDeletedState());
    } on Exception {
      emit(const FailureState(errorMessage: 'errorMessage'));
    }
  }

  Future<void> fetchItems({Map<String, dynamic>? query = const {}}) async {
    if (query == null) return;

    emit(LoadingState());

    try {
      ItemResponse response = await _itemRepository.getItems(query);
      emit(ItemListFetchedState(itemList: response.itemList, lastN: response.lastN));
    } on Exception {
      emit(const FailureState(errorMessage: 'errorMessage'));
    }
  }

  Future<void> insertItem(Item item) async {

    emit(LoadingState());

    try {
      final String id = await _itemRepository.insertItem(item);

      emit(ItemCreatedState(id: id));
    } on Exception {
      emit(const FailureState(errorMessage: 'errorMessage'));
    }
  }

  //Here I need to find out which state is stored as a json and then convert it back into the normal State Object
  //better ideas are appreciated
  @override
  ItemState? fromJson(Map<String, dynamic> json) {
    print(json);
    switch (json["state"]){
      case "InitialState": return InitialState();
      case "LoadingState": return LoadingState();
      case "ItemDeletedState": return ItemDeletedState();
      case "ItemUpdatedState": return ItemUpdatedState();
      case "ItemFetchedState": return ItemFetchedState(item: json["class"]["item"]);
      case "ItemCreatedState": return ItemCreatedState.fromJson(json["class"]);
      case "ItemListFetchedState": return ItemListFetchedState.fromJson(json["class"]);
      case "FailureState": return FailureState.fromJson(json["class"]);
    }
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(ItemState state) {
    switch (state.runtimeType){
      case ItemCreatedState : return {"state": "ItemCreatedState", "class": (state as ItemCreatedState).toJson()};
      case ItemFetchedState : return {"state": "ItemFetchedState", "class": (state as ItemFetchedState).toJson()};
      case ItemListFetchedState : return {"state": "ItemListFetchedState", "class":(state as ItemListFetchedState).toJson()};
      case InitialState : return {"state": "InitialState"};
      case LoadingState : return {"state": "LoadingState"};
      case ItemDeletedState : return {"state": "ItemDeletedState"};
      case ItemUpdatedState : return {"state": "ItemUpdatedState"};
      case FailureState : return {"state": "FailureState", "class":(state as FailureState).toJson()};

      default : return {};
    }
  }
}
