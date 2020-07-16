import 'package:floor/floor.dart';
import 'package:inventory/app/model/base.dart';


abstract class IBaseRepository<T extends Base> {
  
  @insert
  Future<int> insertItem(T item);

  @insert
  Future<int> updateItem(T item);

  @insert
  Future<int> deleteItem(T item);

}