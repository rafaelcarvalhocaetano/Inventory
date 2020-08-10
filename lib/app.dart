import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/app/pages/home/home_page.dart';
import 'package:inventory/app/pages/product/product_list_page.dart';
import 'package:inventory/app/pages/product/product_page.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([
    ]);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0XFF4c1b63),
        accentColor: Colors.purple,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black),),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0XFF4c1b63),),
      ),
      title: 'Inventory',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/list-items': (context) => ProductList(),
        '/items' : (context) => ProductsPage(),
      },
    );
  }

   

}