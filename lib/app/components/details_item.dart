import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory/app/constants/style_details_item.dart';

class DetailsItem extends StatelessWidget {
  final String kTitle;
  final String kDescription;
  final String kQrCode;
  final String kValue;
  final String pathImage;

  DetailsItem(
      {this.kTitle,
      this.kDescription,
      this.kQrCode,
      this.kValue,
      this.pathImage});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Color(0XFF4c1b63),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: 20.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.height / 2.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.crop_original,
                              color: Color(0XFF4c1b63),
                              size: 130.0,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: kProductTitle(kTitle, Colors.grey[800],),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.width / 5.5,
                                child: kDescriptionProduct(kDescription),
                              ),
                            ),
                            kValue != null ? kValueProduct('R\$ $kValue') : kValueProduct('Sem Preço registrado'),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                              child: Container(
                                child: Divider(
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                            Container(
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  kValueProduct('Código do produto', true),
                                  kValueProduct(kQrCode != null ? kQrCode : 'Sem Código'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: 20.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.height / 4,
                    decoration: kBorderProdutc(BorderRadius.circular(20.0),),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset('images/qrcode.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
