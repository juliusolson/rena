import 'package:flutter/material.dart';
import 'package:rena/models/spending.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rena/utils/colors.dart';

class CategoryBars extends StatelessWidget {
  final List<SpendingCategory> categories;
  CategoryBars(this.categories);

  @override
  Widget build(BuildContext context) {
    int total = 0;
    this.categories.forEach((e) => total += e.amount);
    return Container(
        padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: this.categories.length,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (BuildContext ctx, int index) {
              SpendingCategory cat = this.categories[index];
              int color = int.parse("FF" + cat.color.substring(1), radix: 16);
              print(color);
              return Column(children: [
                Stack(children: [
                  Container(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(this.categories[index].name,
                              style: Theme.of(context).textTheme.caption))),
                  Container(
                      padding: EdgeInsets.only(right: 30.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              '${((cat.amount / total) * 100).round()}%     ${cat.amount} kr',
                              style: Theme.of(context).textTheme.caption)))
                ]),
                LinearPercentIndicator(
                  lineHeight: 10.0,
                  percent: this.categories[index].amount / total,
                  backgroundColor: Colors.grey,
                  progressColor: createMaterialColor(
                      Color(color)), //createMaterialColor(Color(0xfffed1e79)),
                ),
              ]);
            }));
  }
}
