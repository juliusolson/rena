import 'package:flutter/material.dart';



class ProfileView extends StatelessWidget{
  final String str;

  ProfileView(this.str);

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