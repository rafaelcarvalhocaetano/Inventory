import 'package:floor/floor.dart';
import 'package:inventory/app/model/inventory.dart';
import 'package:inventory/app/repository/inventory_repository.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Inventory])
abstract class AppDatabase extends FloorDatabase {
  
  IInventoryRepository get inventoryRepository;
}