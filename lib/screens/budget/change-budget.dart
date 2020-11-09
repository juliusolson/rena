import 'package:flutter/material.dart';
import 'package:rena/utils/field_with_label.dart';
import 'package:rena/utils/rena_flatbutton.dart';
import 'package:rena/models/goalmodel.dart';

class BudgetChangeView extends StatefulWidget {
  @override
  _BudgetChangeViewState createState() => _BudgetChangeViewState();

  final Goals data;

  BudgetChangeView(this.data);
}

class _BudgetChangeViewState extends State<BudgetChangeView> {
  TextEditingController savingsController;
  TextEditingController spendingController;

  @override
  void initState() {
    setState(() {
      savingsController = TextEditingController();
      spendingController = TextEditingController();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: Column(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: CloseButton(
                                color: Colors.blue,
                              ))),
                      Flexible(
                          flex: 3,
                          //Header and form
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ändra fördelning",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Text("Budgetar", style: Theme.of(context).textTheme.bodyText1),
                                FieldWithLabel(savingsController,
                                    label: "Veckospar",
                                    suffix: "kr",
                                    numeric: true),
                                FieldWithLabel(spendingController,
                                    label: "Veckospel",
                                    suffix: "kr",
                                    numeric: true),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Fördelning av veckosparande", style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20)),
                      ),
                      Flexible(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.only(top:20),
                              child: ListView.separated(
                                  itemBuilder: (BuildContext context, int idx) {
                                    List<Goal> goals = this.widget.data.goals;
                                    return Stack(children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          // margin: EdgeInsets.only(top: 8),
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .shadowColor,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: []),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: FieldWithLabel(
                                                TextEditingController(
                                                    text: goals[idx]
                                                        .share
                                                        .toString()),
                                                label: this
                                                    .widget
                                                    .data
                                                    .goals[idx]
                                                    .name,
                                                suffix: "%",
                                                numeric: true,
                                              )))
                                    ]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 20.0);
                                  },
                                  itemCount: this
                                      .widget
                                      .data
                                      .goals
                                      .length))), //GoalList
                      RenaFlatButton(
                          "Spara", 200.0, () => {Navigator.of(context).pop()}),
                    ],
                  ),
                ))));
  }
}
