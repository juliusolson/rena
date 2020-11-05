import 'package:flutter/material.dart';

import 'package:rena/models/spending.dart';
import 'package:provider/provider.dart';

class HorizontalScrollSelector extends StatefulWidget {
  final List<String> elements;
  HorizontalScrollSelector(this.elements);
  @override
  _HorizontalScrollSelectorState createState() =>
      _HorizontalScrollSelectorState();
}

class _HorizontalScrollSelectorState extends State<HorizontalScrollSelector> {
  int _selectedIndex;
  ScrollController controller;
  // Init by selecting most recent item i.e. the last
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.elements.length - 1;
    controller = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.jumpTo(controller.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themeActive = Theme.of(context).textTheme.bodyText1;
    TextStyle themeNotActive = themeActive.copyWith(
      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.6),
    );
    return Container(
        child: ListView.builder(
            controller: controller,
            physics: PageScrollPhysics(),
            itemCount: widget.elements.length + 2,
            itemBuilder: (BuildContext ctx, int index) {
              return Center(
                  child: Container(
                      child: index < widget.elements.length
                          ? TextButton(
                              child: Text(widget.elements[index],
                                  style: (this._selectedIndex == index)
                                      ? themeActive
                                      : themeNotActive),
                              onPressed: () => _selected(context, index))
                          : Text(" " * 15)));
            },
            scrollDirection: Axis.horizontal));
  }

  void _selected(BuildContext context, int index) {
    Provider.of<WeeklySpendingModel>(context, listen: false).changeWeek(index);
    setState(() {
      _selectedIndex = index;
    });
    //debugPrint(widget.elements[index].toString() + " Have been selected");
  }
}
