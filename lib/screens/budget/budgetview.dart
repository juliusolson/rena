import 'package:flutter/material.dart';
import 'package:rena/screens/budget/components/budget_overview.dart';
import 'package:rena/utils/colors.dart';
import 'components/goal_card.dart';

class BudgetView extends StatelessWidget {
  final String str;

  BudgetView(this.str);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: BudgetOverview(),
            ),
            Flexible(
                flex: 3,
                child: Column(children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 5,
                            child: Container(
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Treats",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text("Dreams",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1))
                                  ],
                                ),
                                subtitle:
                                    Text("Mindre sparmål mellan 1-5000 kr"),
                              ),
                            )),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: FloatingActionButton(
                              child: Icon(Icons.add),
                              onPressed: null,
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  createMaterialColor(Color(0xff00d3b3)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        separatorBuilder: (BuildContext ctx, int index) =>
                            SizedBox(height: 20),
                        itemBuilder: (BuildContext ctx, int idx) => GoalCard(),
                      ),
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
