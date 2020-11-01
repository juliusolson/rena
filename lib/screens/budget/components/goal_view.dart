import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rena/screens/budget/components/goal_modify.dart';
import 'package:rena/utils/colors.dart';
import 'package:rena/models/goalmodel.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalView extends StatelessWidget {
  final Goal goal;
  GoalView(this.goal);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 300.0),
                      alignment: Alignment.centerRight,
                        child: CloseButton(
                          color: Colors.blue,
                        )),
                    Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          goal.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    Container(
                      child: Text('${goal.saved} kr av ${goal.amount} kr'),
                      padding: EdgeInsets.only(bottom: 5.0),
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: LinearPercentIndicator(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          lineHeight: 10.0,
                          percent: goal.saved / goal.amount,
                          backgroundColor: Colors.grey,
                          clipLinearGradient: true,
                          linearGradient: LinearGradient(colors: [
                            chartColors["pink"],
                            chartColors["orange"],
                            chartColors["yellow"],
                            chartColors["blue"],
                            chartColors["purple"],
                          ]),
                        )),
                    Container(
                        child: Text(
                      goal.description,
                      style: Theme.of(context).textTheme.caption,
                    )),
                    Container(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text("Skapad 2020-08-30",
                          style: Theme.of(context).textTheme.caption),
                      alignment: Alignment.centerRight,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20.0),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            FlatButton(
                              minWidth: 200,
                              color: chartColors["purple"],
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              padding: EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {},
                              child: Text(
                                "Boosta",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            FlatButton(
                              minWidth: 200,
                              color: Colors.white,
                              padding: EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext ctx2) =>
                                        GoalModify(goal));
                              },
                              child: Text(
                                "Ändra",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ],
                        ))
                  ],
                ))));
  }
}
