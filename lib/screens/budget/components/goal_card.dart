import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rena/models/goalmodel.dart';
import 'package:rena/utils/colors.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;
  GoalCard(this.goal);
  
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).shadowColor, width: 2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: []),
      child: Column(
        children: [
          SizedBox(height: 40),
          ListTile(
            title: Text(
              this.goal.name,
              style: Theme.of(context).textTheme.caption,
            ),
            subtitle: Text(
              '${goal.saved} kr av ${goal.amount} kr',
              style: TextStyle(fontFamily: "Montserrat"),
            ),
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.only(left: 20, right: 20),
            lineHeight: 10.0,
            percent: goal.saved/goal.amount,
            backgroundColor: Colors.grey,
            clipLinearGradient: true,
            linearGradient: LinearGradient(colors: [
              chartColors["pink"],
              chartColors["orange"],
              chartColors["yellow"],
              chartColors["blue"],
              chartColors["purple"],
            ]),
          ),
        ],
      ),
    );
  }
}
