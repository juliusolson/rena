import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:rena/models/spending.dart';
import 'package:rena/utils/colors.dart';

class SpendingsPieChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final List<SpendingCategory> data;

  SpendingsPieChart(this.seriesList, {this.animate, this.data});

  factory SpendingsPieChart.customSampleData(List<SpendingCategory> data) {
    return new SpendingsPieChart(
      [
        new charts.Series<SpendingCategory, int>(
          id: 'categories',
          domainFn: (SpendingCategory sc, _) => sc.n,
          measureFn: (SpendingCategory sc, _) => sc.amount,
          data: data,
          colorFn: (SpendingCategory sc, _) =>
              charts.Color.fromHex(code: sc.color),
        )
      ],
      animate: false,
      data: data,
    );
  }

  @override
  State<StatefulWidget> createState() => new _SpendingsPieChartState();
}

class _SpendingsPieChartState extends State<SpendingsPieChart> {
  String category;
  String amount;

  void initState(){
    setState(() {
      category = this.widget.data[0].name;
      amount = this.widget.data[0].amount.toString();
      super.initState();
    });
  }

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
        ])),
      Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: this.widget.data.map((element) {
              return Container(
                  margin: EdgeInsets.only(bottom: 10, right: 10),
                  child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minWidth: 0,
                      height: 0,
                      onPressed: () {setState(() {
                        this.category = element.name;
                        this.amount = element.amount.toString();
                      });},
                      color: (this.category == element.name) ? chartColors[categoryColorMap[element.name]] : Colors.white.withOpacity(0.4),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Icon(
                        categoryIconMap[element.name],
                        color: Theme.of(context).iconTheme.color,
                      )));
            }).toList(),
          ))
    ]);
  }
}
