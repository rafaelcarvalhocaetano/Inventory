import 'package:floor/floor.dart';
import 'package:inventory/app/model/inventory.dart';
import 'package:inventory/app/repository/base_repository.dart';

@dao
abstract class IInventoryRepository extends IBaseRepository<Inventory> {

  @Query('SELECT * FROM TableInventory')
  Future<List<Inventory>> findAll();
  
  @Query('SELECT * FROM TableInventory WHERE id = :id')
  Future<Inventory> findTableInventoryById(int id);

  @Query('DELETE FROM TableInventory WHERE id = :id')
  Future<Inventory> delete(String id);
}