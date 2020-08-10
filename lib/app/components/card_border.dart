import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarBorder extends StatelessWidget {

  final Color color;
  final double withBorder;
  final Widget widget;

  CarBorder(this.color, this.withBorder, this.widget);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:ClipPath(
        clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),),),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
            border: Border(left: BorderSide(color: color, width: withBorder,),),),
            child: widget,
          ),
      ),
    );
  }
}