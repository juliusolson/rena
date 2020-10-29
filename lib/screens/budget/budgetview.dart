import 'package:flutter/material.dart';
import 'package:rena/screens/budget/components/budget_overview.dart';
import 'package:rena/utils/colors.dart';
import 'components/goal_card.dart';
import 'components/goal_creation.dart';
import 'package:rena/models/goalmodel.dart';

class Category {
  final String label;
  final GoalType type;
  Category(this.label, this.type);
}

class BudgetView extends StatefulWidget {
  final String str;
  final List<Category> categories = [
    Category("Dreams", GoalType.Dream),
    Category("Treats", GoalType.Treat),
  ];

  BudgetView(this.str);

  @override
  _BudgetViewState createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  int _itemCount;
  int _selectedIndex;
  GoalType _selectedCategory;

  void initState() {
    super.initState();
    _selectedIndex = 0;
    _selectedCategory = widget.categories[0].type;
    _itemCount =
        dummyGoals.where((element) => element.type == _selectedCategory).length;
  }

  void _select(BuildContext ctx, int index) {
    debugPrint("hej");
    setState(() {
      _selectedIndex = index;
      _selectedCategory = widget.categories[index].type;
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
                                    this.widget.categories[index].label,
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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext ctx2) {
                                      return GoalCreation();
                                    });
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
                          itemCount: _itemCount,
                          separatorBuilder: (BuildContext ctx, int index) =>
                              SizedBox(height: 20),
                          itemBuilder: (BuildContext ctx, int idx) {
                            Goal goal = dummyGoals
                                .where((g) => g.type == _selectedCategory)
                                .toList()[idx];
                            return GoalCard(goal);
                          }),
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
