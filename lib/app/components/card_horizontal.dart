import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/app/components/card_border.dart';
import 'package:inventory/app/components/card_container.dart';
import 'package:inventory/app/pages/product/product_page.dart';

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
  String urlImageDefault =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ9blSYNSPlwvkZnTPO3YfzTsL8YnXVIH5ieg&usqp=CAU';

  String pathIMG() {
    return widget.kPath != null ? widget.kPath : urlImageDefault;
  }

  String textData(String data, String option) {
    return data != null ? data : option;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsPage(),
          ),
        );
      },
      child: CarBorder(
        Colors.purple,
        5,
        CardContainer(
          pathImage: pathIMG(),
          title: 'TESTE',
          code: '21AVGF45',
          itemValue: '22,50',
        ),
      ),
    );
  }
}
