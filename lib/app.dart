
import 'package:flutter/material.dart';
import 'package:inventory/app/database/database.dart';
import 'package:inventory/app/pages/inventory_page.dart';

class App extends StatelessWidget {

  final AppDatabase database;

  App({this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0XFFFD5d5F),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      title: 'Inventory',
      debugShowCheckedModeBanner: false,
      home: InventoryPage(database: database),
    );
  }
}