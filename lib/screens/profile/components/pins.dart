import 'package:flutter/material.dart';
import 'package:rena/models/pin.dart';
import 'package:rena/screens/profile/components/PinInfo.dart';

class Pins extends StatefulWidget {
  final List<String> categories;
  final List<Pin> pins = [
    Pin.dummy(),
    Pin.dummy(),
    Pin.dummy(),
    Pin.dummy(),
    Pin.dummy(),
    Pin.dummy(),
    Pin.dummy(),
    Pin.dummy()
  ];
  Pins(this.categories);
  @override
  _PinsState createState() => _PinsState();
}

class _PinsState extends State<Pins> {
  int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Flexible(
          flex: 1,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return TextButton(
                    child: Text(widget.categories[index],
                        style: (this._selectedIndex != index)
                            ? Theme.of(context).textTheme.headline2
                            : Theme.of(context).textTheme.headline3),
                    onPressed: () => _selected(context, index));
              })),
      Flexible(
          flex: 5,
          child: GridView.builder(
              itemCount: widget.pins.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext ctx, int index) {
                return FlatButton(
                    onPressed: () {
                      debugPrint('$index Pressed');
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx2) {
                            return PinInfo(widget.pins[index]);
                          });
                    },
                    child: Image.asset(widget.pins[index].imageURL));
              }))
    ]);
  }

  void _selected(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
