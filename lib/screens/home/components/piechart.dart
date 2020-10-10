import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:rena/models/spending.dart';

class SpendingsPieChart extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 30,
      ),
    );
  }
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
        )
      )
    ];
  }
}