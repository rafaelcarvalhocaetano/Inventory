import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CardKey extends StatefulWidget {

  Color colors;
  String title;
  IconData icon;
  String itemValue;

  CardKey({this.colors, this.title, this.icon, this.itemValue});

  @override
  _CardKeyState createState() => _CardKeyState();
}

class _CardKeyState extends State<CardKey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: widget.colors,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black12,
          style: BorderStyle.solid,
          width: 2.0
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4.0, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Icon(
            widget.icon,
            color: Colors.white,
            size: 40.0,
          ),
          Center(
            child: Text(
              widget.itemValue,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}