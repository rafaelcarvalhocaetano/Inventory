import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/app/components/card.dart';
import 'package:inventory/app/components/details_item.dart';
import 'package:inventory/app/constants/styles-contant.dart';
import 'package:inventory/app/dao/inventory_dao.dart';
import 'package:inventory/app/model/inventory.dart';
import 'package:inventory/app/pages/inventory_save_page.dart';

// ignore: must_be_immutable
class InventoryPage extends StatefulWidget {


  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {

  String resultCode;
  InventoryDAO dao = InventoryDAO();
  Future<List<Inventory>> _list;

  String titleHeader = 'List Inventary';

  @override
  void initState() {
    super.initState();
    _list = dao.findAllAsync();
  }

  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            initialData: List<Inventory>(),
            future: _list,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Loading .....');
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text('Loading....'),
                        ],
                      ),
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Text('Loading....');
                  break;
                case ConnectionState.done:
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        centerTitle: true,
                        expandedHeight: 180.0,
                        pinned: true,
                        floating: true,
                        elevation: 24.0,
                        backgroundColor: Colors.red[400],
                        actions: [
                          IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InventorySavePage(),
                                ),
                              ).then((x) {
                                if (x == true) {
                                  setState(() {
                                    _list = dao.findAllAsync();
                                  });
                                }
                              });
                            },
                          ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/qrcode.png', width: 80.0, height: 80.0, color: Colors.white),
                                Text(
                                  titleHeader,
                                  style: kHeaderText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.all(20),
                        sliver: SliverGrid(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return GestureDetector(
                                onTap: () => getItem(context, snapshot.data[index].qrCode),
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => alertDialog(snapshot.data[index].title, snapshot.data[index].qrCode),
                                    barrierDismissible: true
                                  );
                                },
                                child: CardItem(
                                  kTitle: snapshot.data[index].title,
                                  kDescription: snapshot.data[index].anotation,
                                  kQrCode: snapshot.data[index].qrCode,
                                  kValue: snapshot.data[index].money,
                                ),
                              );
                            },
                            childCount: snapshot.data.length,
                          ),
                        ),
                      ),
                    ],
                  );
                  break;
              }
              return Center(
                child: Text('Not Contact'),
              );
            },
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => scanner(context),
          tooltip: 'Increment',
          child: Icon(Icons.center_focus_weak),
        ),
      ),
    );
  }

  Widget alertDialog(String data, String code) {
    return AlertDialog(
      title: Text('EXCLUIR', style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700]
      ),),
      content: Text('Item ' + data.toUpperCase() + ' será excluído', style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.red[300]
      ),),
      actions: [
        FlatButton(
          onPressed: () {
            dao.deleteById(code);
            Navigator.of(context).pop();
            setState(() {
              _list = dao.findAllAsync();
            });
          }, 
          child: Text('DELETAR', style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.red[300],
          ),),
        ),
        SizedBox(width: 20.0,),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: Text('EDITAR', style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.red[300]
          ),),
        ),
      ],
    );
  }

  Future scanner(context) async {
    try {
      var keyCode = await BarcodeScanner.scan();
      if (keyCode != null) {
        getItem(context, keyCode);
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

  void getItem(context, String keyCode) async {
    var items = await dao.findAllAsync();
    items.forEach((x) {
      if (x.qrCode == keyCode) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsItem(kTitle: x.title, kDescription: x.anotation, kValue: x.money, kQrCode: x.qrCode,),
          ),
        );
      } else {
        setState(() => titleHeader = 'Produto não Cadastrado');
        Timer(const Duration(milliseconds: 3000), () => setState(() => titleHeader = 'List Inventory',),);
      }
    });
  }
}