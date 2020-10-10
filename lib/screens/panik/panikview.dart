
import 'package:flutter/material.dart';



class PanikView extends StatelessWidget{
  final String str;

  PanikView(this.str);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text(
          this.str,
          style: Theme.of(context).textTheme.bodyText1,
        ),
    ),
    );
  }

}