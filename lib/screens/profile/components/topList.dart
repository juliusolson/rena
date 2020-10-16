import 'package:flutter/material.dart';
import 'package:rena/models/scoreBoard.dart';

class HighScoreList extends StatefulWidget {
  List<String> categories = ['Spelfria dagar', 'Pins'];
  List<ProfileEntry> users;
  HighScoreList(this.users);
  @override
  _HighScoreListState createState() => _HighScoreListState();
}

class _HighScoreListState extends State<HighScoreList> {
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectSorting(0);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themeActive = Theme.of(context).textTheme.bodyText1;
    TextStyle themeNotActive =
        themeActive.copyWith(color: Theme.of(context).accentColor);

    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Flexible(
          flex: 1,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  child: Text('${widget.categories[index]} ',
                      style: (this._selectedIndex != index)
                          ? themeActive
                          : themeNotActive),
                  onPressed: () {
                    _selectSorting(index);
                  },
                );
              })),
      Flexible(
          flex: 3,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Theme.of(context).colorScheme.background,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: widget.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(children: [
                      Expanded(
                          flex: 1,
                          child: Text('${index + 1}.',
                              style: Theme.of(context).textTheme.bodyText1)),
                      Expanded(flex: 1, child: Icon(Icons.account_circle)),
                      Expanded(
                          flex: 4,
                          child: Text('${widget.users[index].name}',
                              style: Theme.of(context).textTheme.bodyText1)),
                      Expanded(
                          flex: 1,
                          child: Text(
                              '${widget.users[index].getCategory(_selectedIndex)}',
                              style: Theme.of(context).textTheme.bodyText1)),
                      Expanded(
                          flex: 1,
                          child: Text('\u{1F4AA}',
                              style: Theme.of(context).textTheme.bodyText1))
                    ]);
                  })))
    ]);
  }

  void _selectSorting(int index) {
    if (index % 2 == 0) {
      widget.users.sort((a, b) {
        return b.gamblingFreeDays.compareTo(a.gamblingFreeDays);
      });
    } else {
      widget.users.sort((a, b) {
        return b.numberOfPins.compareTo(a.numberOfPins);
      });
    }
    setState(() {
      this._selectedIndex = index;
    });
  }
}
