// import 'dart:io';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/app/constants/styles-contant.dart';
import 'package:inventory/app/database/database.dart';
import 'package:inventory/app/model/inventory.dart';

class InventorySave extends StatefulWidget {
  final AppDatabase database;
  final Inventory todo;

  InventorySave({this.database, this.todo});

  @override
  _InventorySaveState createState() => _InventorySaveState();
}

class _InventorySaveState extends State<InventorySave> {
  var _title = TextEditingController(text: '');
  var _descricao = TextEditingController(text: '');
  var _valueData = TextEditingController(text: '');

  String resultCode;
  String value;
  final picker = ImagePicker();
  String path;
  String uriAlt =
      'https://www.fandysoft.com/wp-content/uploads/2017/09/catalog-widget-placeholder.png';
  bool flag = false;

  @override
  void initState() {
    _title = TextEditingController(text: '');
    _descricao = TextEditingController(text: '');
    _valueData = TextEditingController(text: '');
    super.initState();
  }

  void getTextField() async {
    if (_title.text.isNotEmpty && _descricao.text.isNotEmpty && flag == false) {
      var todo = Inventory(
        id: widget.todo != null ? widget.todo.id : null,
        anotation: _descricao.text,
        title: _title.text,
        qrCope: resultCode,
        value: _valueData.text,
        pathImage: path,
        createAt: DateTime.now().toUtc().toString(),
      );
      print(todo.qrCope);
      if (widget.todo != null) {
        widget.database.inventoryRepository.updateItem(todo);
      } else {
        widget.database.inventoryRepository.insertItem(todo);
        Navigator.pop(context);
      }
    }
  }

  Future _scanner() async {
    try {
      resultCode = null;
      String qrResult = await BarcodeScanner.scan();
      _validatorCode(qrResult);
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() => resultCode = "Camera permission was denied");
      } else {
        setState(() => resultCode = "Unknown Error $ex");
      }
    } on FormatException {
      setState(() =>
          resultCode = "You pressed the back button before scanning anything");
    } catch (e) {
      setState(() => resultCode = "Unknown Error $e");
    }
  }

  void _validatorCode(String qrResult) {
    setState(() {
      widget.database.inventoryRepository.findAll().then((onValue) {
        onValue.forEach((x) {
          if (x.qrCope == qrResult) {
            resultCode = 'Produto já Cadastrado';
            flag = true;
          } else {
            resultCode = qrResult;
            flag = false;
          }
        });
      });
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() => path = pickedFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20, right: 20),
            children: <Widget>[
              Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      Center(
                        child: Text(
                          resultCode != null ? resultCode : 'Sem Código',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: path != null
                        ? Image(
                            height: 150,
                            width: 300,
                            image: AssetImage(path),
                            fit: BoxFit.cover,
                          )
                        :
                        // Image.network(uriAlt, fit: BoxFit.cover,),
                        Icon(
                          Icons.image,
                          size: 30.0,
                        ),
                  ),
                  kInput(_title, 'Tipo', false),
                  SizedBox(
                    height: 15,
                  ),
                  kInput(_descricao, 'Descrição', false),
                  SizedBox(
                    height: 15,
                  ),
                  kInput(_valueData, 'Valor', true),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: RaisedButton(
                  elevation: 5.0,
                  color: Theme.of(context).accentColor,
                  onPressed: () => getImage(),
                  child: Container(
                    height: 55,
                    // width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Self Image',
                      style: kButtomSaveDialog,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      elevation: 5.0,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: Border(
                        right: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 2,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 2,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 2,
                            style: BorderStyle.solid),
                        top: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 2,
                            style: BorderStyle.solid),
                      ),
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        child: Text(
                          'Cancel',
                          style: kButtomCancelDialog,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RaisedButton(
                      elevation: 5.0,
                      color: Theme.of(context).accentColor,
                      onPressed: () => getTextField(),
                      child: Container(
                        height: 55,
                        // width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Save',
                          style: kButtomSaveDialog,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _scanner(),
          tooltip: 'Increment',
          child: Icon(Icons.filter_center_focus),
        ),
      ),
    );
  }
}
