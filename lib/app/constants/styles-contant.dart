import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


const kHeaderText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 22.0
);

kInput (TextEditingController title, String hint, bool isNumber) => TextField(
  controller: title,
  keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
  style: TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w500
  ),
  decoration: InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      color: Colors.white54
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white70,
        width: 2.0,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white70,
        width: 2.0,
      ),
    ),
  ),
);

const kCancel = TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14.0,);
const kIconCancel = Icon(Icons.close, color: Colors.red,);
const kSave = TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14.0);

const kTextSubCard = TextStyle(
  color: Color(0XFF727272),
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

const kTextBottom = TextStyle(
  color: Color(0XFFc9c9c9),
  fontSize: 14.0,
  fontWeight: FontWeight.w600
);

const kBorder = BoxDecoration(
  border: Border(
    left: BorderSide(
      color: Color(0XFFFD5d5F),
      width: 5,
    ),
  ),
);

const kButtomSaveDialog =  TextStyle(
  color: Colors.white,
);

const kButtomCancelDialog =  TextStyle(
  color: Color(0XFFFD5d5F),
  fontWeight: FontWeight.bold
);

const kTitleDialog = TextStyle(
  color: Color(0XFF727272),
);

kBorderText(Color color) => BoxDecoration(
  color: color,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(50.0),
    topRight: Radius.circular(50.0),
  ),
);
kCode(Color color) => TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: color,);