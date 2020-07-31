import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:inventory/app/constants/styles-contant.dart';

class CardHorizontal extends StatefulWidget {

  final String kTitle;
  final String kDescription;
  final String kValue;
  final String kPath;

  CardHorizontal({this.kTitle, this.kDescription, this.kValue, this.kPath});


  @override
  _CardHorizontalState createState() => _CardHorizontalState();
}

class _CardHorizontalState extends State<CardHorizontal> {


  String urlImageDefault = 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ9blSYNSPlwvkZnTPO3YfzTsL8YnXVIH5ieg&usqp=CAU';

  String pathIMG() {
    print('path relativo $widget.kPath');
    return widget.kPath != null ? widget.kPath : urlImageDefault;
  }

  // String textData(String data, String option) {
  //   return data != null ? data : option; 
  // }

  @override
  void initState() {
    print('valor image ' + widget.kPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      borderOnForeground: true,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: NetworkImage(pathIMG())
                          ),
                        ),
                      ),
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: <Widget>[
                    //     Text(textData(widget.kTitle, 'Sem Título'), style: kTextSubCard,),
                    //     Text(textData(widget.kDescription, 'Sem Descrição'), style: kTextBottom,)
                    //   ],
                    // ),
                  ],
                ),
                // Text(textData(widget.kValue, 'Sem Valor'), style: kTextBottom,),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.grey[400],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
