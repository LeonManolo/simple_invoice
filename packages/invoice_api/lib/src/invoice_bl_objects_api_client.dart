import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:invoice_api/invoice_api.dart';

/// Exception thrown when locationSearch fails.
class ItemIdRequestFailure implements Exception {
  String message;
  ItemIdRequestFailure(this.message);
}

/// {@template meta_weather_api_client}
/// Dart API Client which wraps the [MetaWeather API](https://www.metaweather.com/api/).
/// {@endtemplate}
class ItemApiClient {
  /// {@macro meta_weather_api_client}
  ItemApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'us-central1-invoice-c63dc.cloudfunctions.net';
  final http.Client _httpClient;

  /// Finds a [Item] `/item:id`.
  dynamic getItemById(String id) async {
    final itemRequest = Uri.https(
      _baseUrl,
      '/api/v1/bl_objects/item/$id',
    );
    final itemResponse = await _httpClient.get(itemRequest);
    print(itemResponse.body);
    if (itemResponse.statusCode != 200) {
      throw ItemIdRequestFailure(itemResponse.body.toString());
    }

    final itemJson = jsonDecode(
      itemResponse.body
    );

    if(itemJson["found"] == {}){
      throw new Exception('No items found');
    }
    try{
    Item item = Item.fromJson(itemJson["found"] as Map<String, dynamic>);
    return item;
  }catch(e){

    }}

  dynamic getItems({Map<String, dynamic> query = const {}}) async {
    final itemRequest = Uri.https(
      _baseUrl,
      '/api/v1/bl_objects/item',
      query
    );
    final itemResponse = await _httpClient.get(itemRequest);
    if (itemResponse.statusCode != 200) {
      throw new Exception(itemResponse.body);
    }

    final itemJson = jsonDecode(
        itemResponse.body
    );

    if(itemJson["found"]["data"].isEmpty){
      throw new Exception('No items found');
    }
    try{
      List<Item> itemList = List<Item>.from(itemJson["found"]["data"].map((item) => Item.fromJson(item)).toList());
      return itemList;
    }catch(e){
      print(e.toString());
    }}
}
