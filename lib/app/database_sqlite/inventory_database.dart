import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabaseAsync(String dataTable) async {
 final String dbpath = await getDatabasesPath();
  final String path = join(dbpath, 'database.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(dataTable);
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<Database> createDatabase(String dataTable) {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'database.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(dataTable);
      }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  });
}