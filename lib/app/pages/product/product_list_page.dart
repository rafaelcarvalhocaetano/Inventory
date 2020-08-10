import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/card_horizontal.dart';


class ProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text('lista de items'),
        actions: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),],
      ),
      // drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
            CardHorizontal(kTitle: 'Teste adsadasdasdasdasdasdsa asdasdasasd', kDescription: 'Teste desc', kValue: '22.0', kPath: 'images/qrcode.png',),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}