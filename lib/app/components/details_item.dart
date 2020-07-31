import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


class DetailsItem extends StatelessWidget {

  final String kTitle;
  final String kDescription;
  final String kQrCode;
  final String kValue;
  final String pathImage;

  DetailsItem({this.kTitle, this.kDescription, this.kQrCode, this.kValue, this.pathImage});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Color(0XFFFD5d5F),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
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
                          Icon(Icons.crop_original, color: Color(0XFFFD5d5F), size: 130.0,),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              kTitle != null ? kTitle : 'Sem Título do Produto',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.width / 5.5,
                              child: Text(
                                  kDescription != null ? kDescription : 'Sem Descrição do produto ofertado',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[500]
                                  ),
                                ),
                            ),
                          ),
                          kValue != null ? 
                          Text('R\$ $kValue', 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]
                            ),
                          ) 
                          :
                          Text('Sem Preço registrado', 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]
                            ),
                          ),  
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                            child: Container(
                              child: Divider(
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                'Código do produto',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[400]
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                kQrCode != null ? kQrCode : 'Sem Código',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey[600]
                                ),
                              ),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 25.0,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                  child: Padding(padding: EdgeInsets.all(10.0), child: Image.asset('images/qrcode.png'),),
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
