import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:rena/models/spending.dart';
import 'dart:math' as math;

class SpendingsBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SpendingsBarChart(this.seriesList, {this.animate});
  
  factory SpendingsBarChart.withSampleData() {
    return new SpendingsBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: new charts.OrdinalAxisSpec(
        renderSpec: new charts.SmallTickRendererSpec(
          labelStyle: new charts.TextStyleSpec(
            color: charts.MaterialPalette.white,
          )
        )
      ),
      primaryMeasureAxis: new charts.NumericAxisSpec(
        renderSpec: new charts.NoneRenderSpec(),
      ),
    );
  }

  static List<charts.Series<WeeklySpending, String>> _createSampleData() {
    final data = List<WeeklySpending>.generate(15, (index) {
      return new WeeklySpending((index+30).toString(), math.Random().nextInt(100));
    });

    return [
      new charts.Series<WeeklySpending, String>(
        id: 'spendings',
        colorFn: (_, int idx) {
          charts.Color col;
          if (idx % 2 == 0) {
            col = charts.Color.fromHex(code: "#00D3B3");
          } else {
            col = charts.Color.fromHex(code: "#7EC5FF");
          }
          return col;
        },
        domainFn: (WeeklySpending ws, _) => ws.week,
        measureFn: (WeeklySpending ws, _) => ws.spendings,
        data: data,
      )
    ];
  }

}