import 'package:floor/floor.dart';

class Base {

  @PrimaryKey(autoGenerate: true)
  final int id;

  final String createAt;
  final String updateAt;

  Base(this.id, this.createAt, this.updateAt);
  
}