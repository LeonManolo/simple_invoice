import 'package:easyinvoice/src/features/clients/presentation/widgets/client_list_tile.dart';
import 'package:easyinvoice/src/features/clients/presentation/widgets/empty_client_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clients"),
        leading: const Icon(Iconsax.search_normal_1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Iconsax.profile_add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            ClientListTile(),
            ClientListTile(),
            ClientListTile(),
            ClientListTile(),
            EmptyClientButton(),
          ],
        ),
      ),
    );
  }
}
