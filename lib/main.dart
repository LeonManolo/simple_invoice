import 'package:easyinvoice/src/app.dart';
import 'package:flutter/material.dart';
import 'package:item_repository/item_repository.dart';

void main() {
  runApp(MyApp(itemRepository: ItemRepository()));
}

