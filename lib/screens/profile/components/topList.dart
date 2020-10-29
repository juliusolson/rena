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
                          ? Theme.of(context).textTheme.headline2
                          : Theme.of(context).textTheme.headline3),
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
              color: Colors
                  .indigo[100], //Theme.of(context).colorScheme.background,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: widget.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HighScoreEntry(
                        widget.users[index], index, (index == 0));
                  })))
    ]);
  }

  void _selectSorting(int index) {
    widget.users.forEach((element) {
      element.setDisplayedCategory(index);
    });
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

class HighScoreEntry extends StatelessWidget {
  ProfileEntry user;
  bool currentUser;
  int index;
  HighScoreEntry(this.user, this.index, this.currentUser);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: currentUser ? Colors.indigo[100] : Colors.blueGrey[100],
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Text('${index + 1}.',
                  style: Theme.of(context).textTheme.bodyText1)),
          Expanded(
              flex: 1,
              child: CircleAvatar(
                  backgroundColor: user.color,
                  child: Text(user.getStringAvatar()))),
          Expanded(
              flex: 4,
              child: Text('${user.name}',
                  style: Theme.of(context).textTheme.bodyText1)),
          Expanded(
              flex: 1,
              child: Text('${user.getDisplayedCategory()}',
                  style: Theme.of(context).textTheme.bodyText1)),
          Expanded(
              flex: 1,
              child: currentUser
                  ? Text('')
                  : Text('\u{1F4AA}',
                      style: Theme.of(context).textTheme.bodyText1))
        ]));
  }
}
