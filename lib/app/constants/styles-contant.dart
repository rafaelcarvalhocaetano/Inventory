import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


const kHeaderText = TextStyle(
  color: Color(0XFF4D4D4D),
  fontWeight: FontWeight.bold,
  fontSize: 32.0
);



kInput (TextEditingController title, String hint, bool is_number) => TextField(
  controller: title,
  keyboardType: is_number == true ? TextInputType.number : TextInputType.text,
  decoration: InputDecoration(
    hintText: hint,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0XFFFD5d5F),
        width: 2.0,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 2.0,
      ),
    ),
  ),
);

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

