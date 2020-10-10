import 'package:flutter/material.dart';



class HomeView extends StatelessWidget{
  final String str;

  HomeView(this.str);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
      child: Text(
          this.str,
        ),
    ),
    );
  }

}