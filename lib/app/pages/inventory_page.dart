import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/app/components/card.dart';
import 'package:inventory/app/constants/styles-contant.dart';
import 'package:inventory/app/database/database.dart';
import 'package:inventory/app/model/inventory.dart';
import 'package:inventory/app/pages/inventory_save_page.dart';

class InventoryPage extends StatefulWidget {
  final AppDatabase database;
  final Inventory todo;

  InventoryPage({this.database, this.todo});

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  bool isColumn = true;

  void alterTable() {
    setState(() => isColumn = !isColumn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<Inventory>>(
          future: widget.database.inventoryRepository.findAll(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        centerTitle: true,
                        expandedHeight: 150.0,
                        pinned: true,
                        floating: true,
                        elevation: 24.0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Cards',
                              style: kHeaderText,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.art_track,
                              color: Color(0XFFFD5d5F),
                            ),
                            onPressed: () => alterTable(),
                          ),
                        ],
                      ),
                      SliverPadding(
                        padding: EdgeInsets.all(20),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return CardItem(
                                kTitle: snapshot.data[index].title,
                                kDescription: snapshot.data[index].anotation,
                                kQrCode: snapshot.data[index].qrCope,
                                kValue: snapshot.data[index].value,
                                indexColor: index,
                                path: snapshot.data[index].pathImage,
                              );
                            },
                            childCount: snapshot.data.length,
                          ),
                        ),
                      ),
                    ],
                  )
                : 
                Center(
                  child: Text(
                    'Sem Cards',
                    style: TextStyle(fontSize: 40.0, color: Colors.red[400],
                    ),
                  ),
                );
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return InventorySave(
                      database: widget.database, todo: widget.todo);
                },
              ),
            );
          },
          tooltip: 'Increment',
          // backgroundColor: Color(0XFF5483f8),
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
