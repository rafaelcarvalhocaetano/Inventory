import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/app/components/details_card.dart';
import 'package:inventory/app/components/image_card.dart';

class CardContainer extends StatelessWidget {

  final String pathImage;
  final String title;
  final String code;
  final String itemValue;

  CardContainer({this.pathImage, this.title, this.code, this.itemValue});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              UserImage(imageURL: pathImage,),
              SizedBox(
                width: 10.0,
              ),
              DetailsCard(title: title, code: code, itemValue: itemValue,),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[500],
        ),
      ],
    );
  }
}