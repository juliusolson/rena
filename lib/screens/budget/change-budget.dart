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
                          //Header and form
                          child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ändra fördelning"),
                            Text("Budgetar"),
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
                      Flexible(
                          child: Container(
                              child: ListView.separated(
                                  itemBuilder: (BuildContext context, int idx) {
                                    return Stack(
                                      children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(top:10),
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
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: FieldWithLabel(
                                        TextEditingController(text: "hej"),
                                        label: this.widget.data.goals[idx].name,
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
                      RenaFlatButton("Spara", 200.0, () => {}),
                    ],
                  ),
                ))));
  }
}
