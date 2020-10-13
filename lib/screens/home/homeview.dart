import 'package:flutter/material.dart';
import 'package:rena/screens/home/components/horizontalScrollSelector.dart';
import '../../models/spending.dart';
import 'components/barchart.dart';
import 'components/piechart.dart';
import 'package:provider/provider.dart';

// const List<String> weeks = [
//   "Vecka 41",
//   "Vecka 42",
//   "Vecka 43",
//   "Vecka 44",
//   "Vecka 45",
//   "Vecka 46"
// ];

class HomeView extends StatelessWidget {
  final String str;
  HomeView(this.str);

  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: ChangeNotifierProvider(
      create: (context) => WeeklySpendingModel(),
      child: Column(children: <Widget>[
        Flexible(
            flex: 1,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Consumer<WeeklySpendingModel>(
                    builder: (context, model, child) {
                  return HorizontalScrollSelector(model.getWeekNames());
                }))),
        Flexible(
          flex: 2,
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
                  Divider(
                    color: Colors.grey,
                    thickness: 10.0,
                  ),
                ]),
          ),
        ),
        Flexible(
            flex: 3,
            child: Container(
              child: SpendingsBarChart.withSampleData(),
            )),
        Flexible(
          flex: 4,
          child:
              Consumer<WeeklySpendingModel>(builder: (context, model, child) {
            return SpendingsPieChart.customSampleData(model.currentCategories);
          }),
        ),
      ]),
    )));
  }
}
