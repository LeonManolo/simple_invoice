import 'package:bl_objects_repository/client/index.dart';
import 'package:bl_objects_repository/invoice/repository.dart';
import 'package:bl_objects_repository/item/repository.dart';
import 'package:bl_objects_repository/user/repository.dart';
import 'package:easyinvoice/src/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );
  runApp(
      MyApp(
        itemRepository: ItemRepository(),
        clientRepository: ClientRepository(),
        invoiceRepository: InvoiceRepository(),
        userRepository: UserRepository()
      )
  );


}

