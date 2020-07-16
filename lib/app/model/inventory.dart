import 'package:floor/floor.dart';
import 'package:inventory/app/model/base.dart';

@Entity(tableName: 'TableInventory')
class Inventory extends Base {

  final String title;
  final String anotation;
  final String qrCope;
  final String value;
  final String pathImage;

  Inventory({int id, String createAt, String updateAt, this.title, this.anotation, this.qrCope, this.value, this.pathImage}): super (id, createAt, updateAt);

  
}