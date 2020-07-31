// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/app/components/card_key.dart';
import 'package:inventory/app/model/inventory.dart';

class ItemInventory extends StatefulWidget {

  final Inventory inventory;

  ItemInventory({this.inventory});

  @override
  _ItemInventoryState createState() => _ItemInventoryState();
}

class _ItemInventoryState extends State<ItemInventory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(          
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Image.asset(
                  //     // widget.inventory.pathImage,
                  //     height: 250.0,
                  //     width: double.infinity,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text('VALOR', style: TextStyle(
                            fontSize: 14.0,
                          ),),
                          Text(widget.inventory.money, style: TextStyle(
                            fontSize: 42.0,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 18.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CardKey(
                          colors: Colors.amber[200],
                          title: 'TÍTULO',
                          icon: Icons.format_indent_decrease,
                          itemValue: widget.inventory.title,
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: CardKey(
                          colors: Color(0XFFFD5d5F),
                          title: 'CÓDIGO',
                          icon: Icons.center_focus_weak,
                          itemValue: widget.inventory.qrCode,
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Text(widget.inventory.anotation, style: TextStyle(
                        fontSize: 22.0,
                      ),),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

