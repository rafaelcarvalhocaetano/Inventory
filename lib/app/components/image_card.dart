import 'package:flutter/widgets.dart';

class UserImage extends StatelessWidget {

  final String imageURL;

  UserImage({this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(imageURL, width: 50.0, height: 50.0,),
    );
  }
}