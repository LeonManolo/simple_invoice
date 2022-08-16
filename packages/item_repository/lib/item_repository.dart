import 'dart:async';

import 'package:invoice_api/invoice_api.dart';


class ItemFailure implements Exception {}

class ItemRepository {
  ItemRepository({ItemApiClient? itemApiClient})
      : _itemApiClient = itemApiClient ?? ItemApiClient();

  final ItemApiClient _itemApiClient;

  Future<Item> getItem(String id) async{
    Item item = await _itemApiClient.getItemById(id);
    return item;
  }

  Future<List<Item>> getItems(Map<String, dynamic> query) async{
    List<Item> items = await _itemApiClient.getItems(query);
    return items;
  }
}