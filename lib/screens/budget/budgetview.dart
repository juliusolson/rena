import 'package:flutter/material.dart';
import 'package:rena/screens/budget/components/budget_overview.dart';
import 'package:rena/utils/colors.dart';
import 'components/goal_card.dart';
import 'components/goal_creation.dart';
import 'components/goal_view.dart';
import 'package:rena/models/goalmodel.dart';
import 'package:provider/provider.dart';

class Category {
  final String label;
  final GoalType type;
  final String description;
  Category(this.label, this.type, this.description);
}

class BudgetView extends StatefulWidget {
  final String str;
  final List<Category> categories = [
    Category("Treats", GoalType.Treat, "Sparmål under 5000 kr"),
    Category("Dreams", GoalType.Dream, "Sparmål från 5000 kr"),
  ];

  BudgetView(this.str);

  @override
  _BudgetViewState createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  int _selectedIndex;
  GoalType _selectedCategory;

  Goals goals = new Goals();

  void initState() {
    super.initState();
    _selectedIndex = 0;
    _selectedCategory = widget.categories[0].type;
  }

  void _select(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedCategory = widget.categories[index].type;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themeActive = Theme.of(context).textTheme.headline2;

    TextStyle themeInactive = themeActive.copyWith(
      color: Theme.of(context).textTheme.headline2.color.withOpacity(0.6),
    );
    return SafeArea(
      child: ChangeNotifierProvider<Goals>.value(
          value: this.goals,
          builder: (context, child) {
            return Center(
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
                                  child: Stack(children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: this.widget.categories.length,
                                      itemBuilder:
                                          (BuildContext ctx, int index) {
                                        return TextButton(
                                          child: Text(
                                            this.widget.categories[index].label,
                                            style:
                                                (this._selectedIndex == index)
                                                    ? themeActive
                                                    : themeInactive,
                                          ),
                                          onPressed: () => _select(index),
                                        );
                                      },
                                    )),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              this
                                                  .widget
                                                  .categories[_selectedIndex]
                                                  .description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ))),
                                  ])),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: FloatingActionButton(
                                    child: Icon(Icons.add),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return GoalCreation(
                                                data: Provider.of<Goals>(
                                                    context));
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
                            padding:
                                EdgeInsets.only(top: 30, left: 10, right: 10),
                            child: Consumer<Goals>(
                                builder: (context, goals, child) {
                              return ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: goals.goals
                                      .where((element) =>
                                          element.type == _selectedCategory)
                                      .toList()
                                      .length,
                                  separatorBuilder:
                                      (BuildContext ctx, int index) =>
                                          SizedBox(height: 20),
                                  itemBuilder: (BuildContext context, int idx) {
                                    Goal g = goals.goals
                                        .where(
                                            (g) => g.type == _selectedCategory)
                                        .toList()[idx];
                                    return GestureDetector(
                                      onTap: () => showDialog(
                                          context: context,
                                          builder: (_) {
                                            return GoalView(
                                                goals.goals.indexOf(g),
                                                Provider.of<Goals>(context));
                                          }),
                                      child: GoalCard(g),
                                    );
                                  });
                            }),
                          ),
                        ),
                      ]))
                ],
              ),
            );
          }),
    );
  }
}
