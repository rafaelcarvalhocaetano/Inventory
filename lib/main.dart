import 'package:flutter/material.dart';
import 'package:inventory/app.dart';
import 'package:inventory/app/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(database: await $FloorAppDatabase.databaseBuilder('database.db').build(),),);
}