import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/app/constants/styles_contant.dart';


class CardItem extends StatelessWidget {

  final String kTitle;
  final String kDescription;
  final String kQrCode;
  final String kValue;

  CardItem({this.kTitle, this.kDescription, this.kQrCode, this.kValue});

  @override
  Widget build(BuildContext context) {

    return Card(
        elevation: 5.0,
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
                Image(
                  width: 60.0,
                  height: 60.0,
                  image: AssetImage('images/qrcode.png'),
                  fit: BoxFit.cover,
                  color: Colors.grey[800],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      kTitle != null ? kTitle.toUpperCase() : 'Sem Titulo',
                      style: kTextSubCard
                    ),
                    Text(
                        kDescription,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: kTextBottom
                      ),
                    Text(
                      kQrCode != null ? kQrCode : 'Sem Código',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: kTextBottom
                    ),
                    Text(
                      kValue != null ? 'R\$ ' + kValue : 'Sem Valor',
                      style: kTextBottom
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
