import 'package:easyinvoice/src/features/invoices/presentation/screens/create_invoice_screen.dart';
import 'package:easyinvoice/src/features/invoices/presentation/screens/invoice_detail_screen.dart';
import 'package:easyinvoice/src/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_repository/item_repository.dart';

import '../bl_objects/item/item_cubit.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.itemRepository}) : super(key: key);

  final ItemRepository itemRepository;
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Start();
        },
      ),
      GoRoute(
        path: '/invoice-detail',
        builder: (BuildContext context, GoRouterState state) =>
            const InvoiceDetailScreen(),
      ),
      GoRoute(
        path: '/create-invoice',
        builder: (context, state) => const CreateInvoiceScreen(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: itemRepository,
      child: BlocProvider(
      create: (context) => ItemCubit(context.read<ItemRepository>()),
      child: MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Invoice',
      theme: ThemeData(
        textTheme: GoogleFonts.signikaNegativeTextTheme(),
        //GoogleFonts.rubikTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        primarySwatch: Colors.deepPurple,
      ),
    )
    )
    );
  }
}
