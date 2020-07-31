import 'package:inventory/app/database_sqlite/inventory_database.dart';
import 'package:inventory/app/model/inventory.dart';
import 'package:sqflite/sqflite.dart';

class InventoryDAO {

  static final String tableName = 'tbl_inventary';
  
  static final String dataTableSql = 
  'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, create_at TEXT, update_at TEXT, title TEXT, anotation TEXT, qr_code TEXT, item_value TEXT)';

  Future<int> saveAsync(Inventory inventory) async {
    final Database db = await createDatabaseAsync(dataTableSql);
    final Map<String, dynamic> inventoryMap = Map();
    inventoryMap['create_at'] = DateTime.now().toUtc().toString();
    inventoryMap['update_at'] = inventory.updateAt;
    inventoryMap['title'] = inventory.title;
    inventoryMap['anotation'] = inventory.anotation;
    inventoryMap['qr_code'] = inventory.qrCode;
    inventoryMap['item_value'] = inventory.money;
    return db.insert(tableName, inventoryMap);
  }


  Future<List<Inventory>> findAllAsync() async {

    final Database db = await createDatabaseAsync(dataTableSql);
    var conts = await db.query(tableName);
    final List<Inventory> inventory = List();

    for(Map<String, dynamic> map in conts) {
      final Inventory contact = Inventory(
        id: map['id'],
        createAt: map['create_at'],
        updateAt: map['update_at'],
        title: map['title'],
        anotation: map['anotation'],
        qrCode: map['qr_code'],
        money: map['item_value']
      );
      inventory.add(contact);
    }
    return inventory;
  }

  Future<int> queryRowCount() async {
    Database db = await createDatabase(dataTableSql);
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<void> deleteById(String id) async {
    Database db = await createDatabase(dataTableSql);
    await db.delete(tableName, where: 'qr_code = ?', whereArgs: [id]);
  }


}