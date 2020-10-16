import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:rena/models/spending.dart';

class SpendingsPieChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SpendingsPieChart(this.seriesList, {this.animate});

  factory SpendingsPieChart.customSampleData(List<SpendingCategory> data) {
    debugPrint(data.toString());
    return new SpendingsPieChart([
      new charts.Series<SpendingCategory, int>(
        id: 'categories',
        domainFn: (SpendingCategory sc, _) => sc.n,
        measureFn: (SpendingCategory sc, _) => sc.amount,
        data: data,
        colorFn: (SpendingCategory sc, _) =>
            charts.Color.fromHex(code: sc.color),
      )
    ], animate: true);
  }

  @override
  State<StatefulWidget> createState() => new _SpendingsPieChartState();
}

class _SpendingsPieChartState extends State<SpendingsPieChart> {
  String category;
  String amount;

  _onSelectionChanged(charts.SelectionModel model) {
    if (model.selectedDatum.isNotEmpty) {
      SpendingCategory sc = model.selectedDatum.first.datum;
      debugPrint(sc.name);
      setState(() {
        category = sc.name;
        amount = sc.amount.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
      )),
      if (amount != null && category != null)
        Align(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
