import 'package:flutter/material.dart';
import 'package:rena/screens/home/components/categorybars.dart';
import 'package:rena/screens/home/components/horizontalScrollSelector.dart';
import 'package:rena/models/spending.dart';
import 'components/barchart.dart';
import 'components/piechart.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rena/utils/colors.dart';
import 'dart:math';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedWidget = 'pie';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: ChangeNotifierProvider(
      create: (context) => WeeklySpendingModel(),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
              Widget>[
        Flexible(
            flex: 1,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Consumer<WeeklySpendingModel>(
                    builder: (context, model, child) {
                  return HorizontalScrollSelector(model.getWeekNames());
                }))),
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spelat för denna vecka",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Consumer<WeeklySpendingModel>(
                      builder: (context, model, child) {
                    return Text(
                      "${model.spending} kr",
                      style: Theme.of(context).textTheme.bodyText1,
                    );
                  }),
                  Consumer<WeeklySpendingModel>(
                      builder: (context, model, child) {
                    return LinearPercentIndicator(
                      lineHeight: 10.0,
                      percent: model.spending / 500.0,
                      backgroundColor: Colors.grey,
                      progressColor: createMaterialColor(Color(0xfffed1e79)),
                    );
                  }),
                ]),
          ),
        ),
        Flexible(
            flex: 2,
            child: Container(
              child: Consumer<WeeklySpendingModel>(
                builder: (context, model, child) {
                  return SpendingsBarChart.withDummyData(model.data);
                }
              ),
            )),
        Flexible(
          flex: 4,
          child: Column(
            children: [
              Flexible(
                  child: ListTile(
                title: Text(
                  "Utgifter",
                  style: Theme.of(context).textTheme.headline2,
                ),
                subtitle: Row(
                  children: [
                    FlatButton(
                        onPressed: () => setState(() {
                              this._selectedWidget = 'pie';
                            }),
                        child: null,
                        textColor: Theme.of(context).textTheme.bodyText1.color,
                        shape: CircleBorder(
                          side: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              width: 1.5,
                              style: BorderStyle.solid),
                        )),
                    Transform.rotate(
                        angle: 90 * pi / 180,
                        child: IconButton(
                          icon: Icon(
                            Icons.bar_chart_outlined,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          color: Colors.white,
                          onPressed: () => setState(() {
                            this._selectedWidget = 'bars';
                          }),
                        ))
                  ],
                ),
              )),
              Flexible(
                flex: 4,
                child: Consumer<WeeklySpendingModel>(
                    builder: (context, model, child) {
                  switch (_selectedWidget) {
                    case 'pie':
                      return SpendingsPieChart.customSampleData(
                          model.currentCategories);
                      break;
                    case 'bars':
                      return CategoryBars(model.currentCategories);
                      break;
                    default:
                      return SpendingsPieChart.customSampleData(
                          model.currentCategories);
                  }
                }),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
