import 'package:flutter/material.dart';
import 'package:rena/screens/budget/components/budget_overview.dart';
import 'package:rena/utils/colors.dart';
import 'components/goal_card.dart';
import 'components/goal_creation.dart';

class BudgetView extends StatefulWidget {
  final String str;
  final List<String> categories =  <String>["Dreams", "Treats"];

  BudgetView(this.str);

  @override 
  _BudgetViewState createState() => _BudgetViewState();

}

class _BudgetViewState extends State<BudgetView> {
  int _selectedIndex;

  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _select(BuildContext ctx, int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themeInactive = Theme.of(context).textTheme.bodyText1;
    TextStyle themeActive = themeInactive.copyWith(
      decoration: TextDecoration.underline,
      color: Theme.of(context).accentColor,
    );
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
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: this.widget.categories.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return TextButton(
                              child: Text(
                                this.widget.categories[index],
                                style: (this._selectedIndex == index)
                                ? themeActive
                                : themeInactive,
                              ),
                              onPressed: () => _select(ctx, index),
                              );
                          },
                        )),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: FloatingActionButton(
                              child: Icon(Icons.add),
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext ctx2) {
                                    return GoalCreation();
                                  }
                                );
                              },
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
