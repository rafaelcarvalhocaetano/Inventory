import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/app/constants/styles-contant.dart';

class CardItem extends StatefulWidget {

  final String kTitle;
  final String kDescription;
  final String kQrCode;
  final String kValue;
  final int indexColor;
  final String path;

  CardItem({this.kTitle, this.kDescription, this.indexColor, this.kQrCode, this.kValue, this.path});

  @override
  _CardItem createState() => _CardItem();
}

class _CardItem extends State<CardItem> {
  
  bool active = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => active = !active),
      child: Card(
        elevation: 5.0,
        color: active ? Colors.grey[100] : Colors.white,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
            decoration: kBorder,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Icon(
                //   Icons.data_usage,
                //   size: 40.0,
                //   color: Color(0XFFFD5d5F),
                // ),

                // criar componente
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 55,
                    width: 55,
                    child: Image(
                      image: AssetImage(widget.path), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.kTitle.toUpperCase(),
                      style: kTextSubCard
                    ),
                    Text(
                      widget.kDescription,
                      style: kTextBottom
                    ),
                    Text(
                      widget.kQrCode != null ? widget.kQrCode : 'Sem Código',
                      style: kTextBottom
                    ),
                    widget.kValue != null ? Text(
                      widget.kValue != null ? widget.kValue : 'Sem Valor',
                      style: kTextBottom
                    ) : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
