
import 'package:flutter/material.dart';



class PanikView extends StatelessWidget{
  final String str;

  PanikView(this.str);

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.str,
        ),
      ],
    );
  }

}