import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/app/constants/styles-contant.dart';
import 'package:inventory/app/dao/inventory_dao.dart';
import 'package:inventory/app/model/inventory.dart';

class InventorySavePage extends StatefulWidget {

  

  @override
  _InventorySavePageState createState() => _InventorySavePageState();
}

class _InventorySavePageState extends State<InventorySavePage> {

  InventoryDAO dao = InventoryDAO();

  String createAt;
  String updateAt;
  String title;
  String anotation;
  String qrCode;

  String resultCode;
  bool isCode = false;

  var _title = TextEditingController();
  var _description = TextEditingController();
  var _valueData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Código do Produto'),
                      Wrap(
                        children: [
                          Text(
                            resultCode != null ? resultCode : 'Sem Código',
                            style: kCode(Colors.red[400],),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: kBorderText(Colors.red[400]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          kInput(_title, 'Tipo', false),
                          kInput(_description, 'Descrição', false),
                          kInput(_valueData, 'Valor', true),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RaisedButton.icon(
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                              color: Colors.white,
                              icon: kIconCancel,
                              label: Text(
                                'Cancel',
                                style: kCancel,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: RaisedButton.icon(
                              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                              color: Colors.white,
                              onPressed: () {
                                requestItem();
                              },
                              icon: Icon(
                                Icons.save,
                                color: Colors.red,
                              ),
                              label: Text(
                                'Save',
                                style: kSave,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => scanner(),
          tooltip: 'Increment',
          backgroundColor: Colors.white,
          child: Icon(
            Icons.filter_center_focus,
            color: Colors.red,
            size: 30.0,
          ),
        ),
      ),
    );
  }

  Future scanner() async {
    try {
      resultCode = null;
      resultCode = await BarcodeScanner.scan();
      if (resultCode != null) {
        validatorCode(resultCode);
      }
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        resultCode = "Camera permission was denied";
      } else {
        resultCode = "Unknown Error $ex";
      }
    } on FormatException {
      resultCode = "You pressed the back button before scanning anything";
    } catch (e) {
      resultCode = "Unknown Error $e";
    }
  }

  void validatorCode(String qrResult) {
    dao.findAllAsync().then((inventory) {
      inventory.forEach((inv) {
        setState(() {
          if (inv.qrCode == qrResult) {
            resultCode = 'Produto já Cadastrado';
            isCode = true;
          } else {
            resultCode = qrResult;
            isCode = false;
          }
        });
      });
    });
  }

  void requestItem() async {
   if (_title.text.isNotEmpty && _description.text.isNotEmpty) {
      if (isCode == true) {
        resultCode = 'Erro ao Salvar';
      } else {
        var data = Inventory(
          createAt: DateTime.now().toUtc().toString(),
          updateAt: '',
          anotation: _description.text,
          title: _title.text,
          qrCode: resultCode,
          money: _valueData.text
        );
        await dao.saveAsync(data);
        _title.clear();
        _description.clear();
        _valueData.clear();   
        Navigator.of(context).pop(true);
      }
    }
  }
}
