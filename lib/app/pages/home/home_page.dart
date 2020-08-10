import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatelessWidget {

   _timeRouter(context) {
    const temp = Duration(milliseconds: 2500);
    Future.delayed(temp, () => Navigator.of(context).popAndPushNamed('/list-items'),);
  }

  @override
  Widget build(BuildContext context) {

    _timeRouter(context);

    return Scaffold(
      backgroundColor: Color(0XFF4c1b63),
      body: Container(
        width: double.infinity,
        height: double.infinity,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: Colors.white,
                  width: 7.0,
                ),
              ),
              child: Image.asset('images/qrcode.png',),
            ),
          ),
        ),
    );
  }
}