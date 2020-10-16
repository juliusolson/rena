import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rena/utils/colors.dart';

class GoalCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: []),
      child: Column(
        children: [
          SizedBox(height: 40),
          ListTile(
            title: Text(
              "Nya hörlurar",
              style: Theme.of(context).textTheme.caption,
            ),
            subtitle: Text(
              "100 kr av 600 kr",
              style: TextStyle(fontFamily: "Montserrat"),
            ),
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.only(left: 20, right: 20),
            lineHeight: 10.0,
            percent: 0.9,
            backgroundColor: Colors.grey,
            clipLinearGradient: true,
            linearGradient: LinearGradient(colors: [
              createMaterialColor(Color(0xffed1e79)), // rosa
              createMaterialColor(Color(0xfff15a24)), // orange
              createMaterialColor(Color(0xfffbae17)), //gul
              createMaterialColor(Color(0xff7ec5ff)), //blå
              createMaterialColor(Color(0xff8333ff)), //lila
            ]),
          ),
        ],
      ),
    );
  }
}
