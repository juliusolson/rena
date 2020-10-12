import 'package:flutter/material.dart';

class HorizontalScrollSelector extends StatefulWidget {
  List<String> elements;
  HorizontalScrollSelector(this.elements);
  @override
  _HorizontalScrollSelectorState createState() =>
      _HorizontalScrollSelectorState();
}

class _HorizontalScrollSelectorState extends State<HorizontalScrollSelector> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle themeActive = Theme.of(context).textTheme.bodyText1;
    TextStyle themeNotActive =
        themeActive.copyWith(color: Theme.of(context).accentColor);
    return ListView.builder(
      physics: PageScrollPhysics(),
      itemCount: widget.elements.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Center(
            child: Container(
                child: TextButton(
                    child: Text(widget.elements[index],
                        style: (this._selectedIndex != index)
                            ? themeActive
                            : themeNotActive),
                    onPressed: () => _selected(index))));
      },
      scrollDirection: Axis.horizontal,
    );
  }

  void _selected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    //debugPrint(widget.elements[index].toString() + " Have been selected");
  }
}
