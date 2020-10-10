import 'package:flutter/material.dart';
import 'components/barchart.dart';
import 'components/piechart.dart';

const List<String> weeks = [
  "Vecka 41",
  "Vecka 42",
  "Vecka 43",
  "Vecka 41",
  "Vecka 42",
  "Vecka 43"
];

class HomeView extends StatelessWidget {
  final String str;
  HomeView(this.str);

  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left:20, right:20),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: weeks.length,
              separatorBuilder: (BuildContext ctx, int index) =>
                  SizedBox(width: 40),
              itemBuilder: (BuildContext ctx, int index) {
                return Center(
                    child: Container(
                        child: Text(
                  weeks[index],
                  style: Theme.of(context).textTheme.bodyText1,
                )));
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
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
                  Text(
                    "100 kr",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
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
          child: Stack(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                "Utgifter",
                style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Container(
              child: SpendingsPieChart.withSampleData(),
            ),
            Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  "100 kr",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "spel",
                  style: Theme.of(context).textTheme.caption,
                ),
              ]))
          ]),
        ),
      ]),
    ));
  }
}
