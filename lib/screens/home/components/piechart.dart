import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:rena/models/spending.dart';

class SpendingsPieChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SpendingsPieChart(this.seriesList, {this.animate});

  factory SpendingsPieChart.withSampleData() {
    return new SpendingsPieChart(
      _createSampleData(),
      animate: true,
    );
  }


  @override
  State<StatefulWidget> createState() => new _SpendingsPieChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<SpendingCategory, int>> _createSampleData() {
    final data = [
      new SpendingCategory(10, 0,"Housing", "#ED1E79"),
      new SpendingCategory(50, 1, "Food", "#FBAE17"),
      new SpendingCategory(20, 2, "Entertainment", "#F15A24"),
      new SpendingCategory(10, 3, "Transportation", "#7EC5FF"),
      new SpendingCategory(14, 4, "Misc", "#8333FF"),
    ];

    return [
      new charts.Series<SpendingCategory, int>(
        id: 'Sales',
        domainFn: (SpendingCategory sales, _) => sales.n,
        measureFn: (SpendingCategory sales, _) => sales.amount,
        data: data,
        colorFn: (SpendingCategory sc, _) => charts.Color.fromHex(
          code: sc.color
        ),
      )
    ];
  }

}

class _SpendingsPieChartState extends State<SpendingsPieChart> {

  String category;
  String amount;

  _onSelectionChanged(charts.SelectionModel model) {
    if (model.selectedDatum.isNotEmpty) {
      SpendingCategory sc = model.selectedDatum.first.datum;
      setState(() {
        category = sc.name;
        amount = sc.amount.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
              child: new charts.PieChart(
                widget.seriesList,
                animate: widget.animate,
                defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 25,
                ),
                selectionModels: [
                  new charts.SelectionModelConfig(
                    type: charts.SelectionModelType.info,
                    changedListener: _onSelectionChanged,
                  ),
                ],
              )
            ),
            if (amount != null && category != null) Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  amount + " kr",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  category,
                  style: Theme.of(context).textTheme.caption,
                ),
              ]))
          ]);
    

  }
}