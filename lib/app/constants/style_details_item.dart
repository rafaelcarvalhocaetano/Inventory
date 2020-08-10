import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

kProductTitle(String title, Color colors) => Text(
      title != null ? title : 'Sem Título do Produto',
      style: TextStyle(
        fontSize: 20.0,
        color: colors,
        fontWeight: FontWeight.bold,
      ),
    );

kDescriptionProduct(String description) => Text(
      description != null ? description : 'Sem Descrição do produto ofertado',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: 3,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.grey[500],
      ),
    );

kValueProduct(String title, [flag = false]) => Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: !flag ? FontWeight.bold : FontWeight.normal,
        color: Colors.grey[600],
      ),
    );

kBorderProdutc(BorderRadius bdl) => BoxDecoration(
      color: Colors.white,
      borderRadius: bdl,
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 25.0,
          spreadRadius: 0.1,
        ),
      ],
    );
