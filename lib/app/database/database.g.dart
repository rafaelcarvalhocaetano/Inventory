// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  IInventoryRepository _inventoryRepositoryInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TableInventory` (`title` TEXT, `anotation` TEXT, `qrCope` TEXT, `value` TEXT, `pathImage` TEXT, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `createAt` TEXT, `updateAt` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  IInventoryRepository get inventoryRepository {
    return _inventoryRepositoryInstance ??=
        _$IInventoryRepository(database, changeListener);
  }
}

class _$IInventoryRepository extends IInventoryRepository {
  _$IInventoryRepository(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _inventoryInsertionAdapter = InsertionAdapter(
            database,
            'TableInventory',
            (Inventory item) => <String, dynamic>{
                  'title': item.title,
                  'anotation': item.anotation,
                  'qrCope': item.qrCope,
                  'value': item.value,
                  'pathImage': item.pathImage,
                  'id': item.id,
                  'createAt': item.createAt,
                  'updateAt': item.updateAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _tableInventoryMapper = (Map<String, dynamic> row) => Inventory(
      id: row['id'] as int,
      createAt: row['createAt'] as String,
      updateAt: row['updateAt'] as String,
      title: row['title'] as String,
      anotation: row['anotation'] as String,
      qrCope: row['qrCope'] as String,
      value: row['value'] as String,
      pathImage: row['pathImage'] as String);

  final InsertionAdapter<Inventory> _inventoryInsertionAdapter;

  @override
  Future<List<Inventory>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM TableInventory',
        mapper: _tableInventoryMapper);
  }

  @override
  Future<Inventory> findTableInventoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM TableInventory WHERE id = ?',
        arguments: <dynamic>[id], mapper: _tableInventoryMapper);
  }

  @override
  Future<Inventory> delete(String id) async {
    return _queryAdapter.query('DELETE FROM TableInventory WHERE id = ?',
        arguments: <dynamic>[id], mapper: _tableInventoryMapper);
  }

  @override
  Future<int> insertItem(Inventory item) {
    return _inventoryInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateItem(Inventory item) {
    return _inventoryInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(Inventory item) {
    return _inventoryInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.abort);
  }
}