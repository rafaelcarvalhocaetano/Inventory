import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/app/constants/style_card_horizontal.dart';

class DetailsCard extends StatelessWidget {

  final String title;
  final String code;
  final String itemValue;

  DetailsCard({this.title, this.code, this.itemValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kCardTitle,
        ),
        Text(
          code,
          style: kCardText(Colors.grey),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          itemValue,
          style: kCardText(Colors.grey),
        ),
      ],
    );
  }
}