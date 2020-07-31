import 'package:flutter/material.dart';
import 'package:inventory/app/pages/inventory_page.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0XFFFD5d5F),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0XFFFD5D5F)
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      title: 'Inventory',
      debugShowCheckedModeBanner: false,
      home: InventoryPage(),
    );
  }

   

}