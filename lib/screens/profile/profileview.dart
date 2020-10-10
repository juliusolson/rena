import 'package:flutter/material.dart';



class ProfileView extends StatelessWidget{
  final String str;

  ProfileView(this.str);

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