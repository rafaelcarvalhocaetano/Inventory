
import 'package:inventory/app/dao/inventory_dao.dart';

class Inventory {

  int id;
  final String createAt;
  final String updateAt;
  final String title;
  final String anotation;
  final String qrCode;
  final String money;
  // final String pathImage;

  // String storedImage;
  // var imageFile = ImagePicker();
  // File file;
  InventoryDAO dao = InventoryDAO();

  Inventory({
    this.id,
    this.createAt,
    this.updateAt,
    this.title,
    this.anotation,
    this.qrCode,
    this.money,
    // this.pathImage
  });

  @override
  String toString() {
    return 'INVENTORY {id: $id, createAt: $createAt, updateAt: $updateAt, title: $title, anotation: $anotation, qrCode: $qrCode, grana: $money }';
  }

  // void addItem(String _title, String _description, String money) async {
  //  if (_title.isNotEmpty && _description.isNotEmpty) {
  //     if (isCode == true) {
  //       await dao.saveAsync(Inventory(
  //       id: null,
  //       createAt: DateTime.now().toUtc().toString(),
  //       updateAt: '',
  //       anotation: _description,
  //       title: _title,
  //       qrCode: resultCode,
  //       money: money
  //     ));
  //     } else {
  //       resultCode = 'Erro ao Salvar';
  //     }
  //   }
  // }

  // Future scanner() async {
  //   try {
  //     resultCode = null;
  //     resultCode = await BarcodeScanner.scan();
  //     if (resultCode != null) {
  //       validatorCode(resultCode);
  //     }
  //   } on PlatformException catch (ex) {
  //     if (ex.code == BarcodeScanner.CameraAccessDenied) {
  //       resultCode = "Camera permission was denied";
  //     } else {
  //       resultCode = "Unknown Error $ex";
  //     }
  //   } on FormatException {
  //     resultCode = "You pressed the back button before scanning anything";
  //   } catch (e) {
  //     resultCode = "Unknown Error $e";
  //   }
  // }



  List<Inventory> _list = [];
  List<Inventory> get items => _list;

  buildList(item) {
    _list.add(item);
  }

}
