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
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              itemCount: widget.categories.length,
              controller: PageController(
                viewportFraction: 1,
                initialPage: 0
              ),
              onPageChanged: (int page){setState(() {
                this._selectedIndex = page;
              });},
              itemBuilder: (BuildContext ctx, int index) {
                return _getHighScoreListView(index);
              }))
    ]);
  }
  Widget _getHighScoreListView(int categoryIndex){
    _selectSorting(categoryIndex);
    List<Widget> widgets = new List();
    for (var i = 0; i < widget.users.length; i++) {
      widgets.add(HighScoreEntry(widget.users[i], i));
    }
    return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5), //Theme.of(context).colorScheme.background,
              margin: EdgeInsets.symmetric(horizontal: 20), 
              child: ListView(children: widgets));
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
    //setState(() {
      //this._selectedIndex = index;
    //});
  }
}

class HighScoreEntry extends StatelessWidget {
  ProfileEntry user;
  int index;
  HighScoreEntry(this.user, this.index);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: user.isCurrentUser ? Colors.indigo[100] : Colors.transparent,
        elevation: 0,
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
          Spacer(

          ),
          Expanded(
              flex: 4,
              child: Text('${user.name}',
                  style: Theme.of(context).textTheme.bodyText2)),
          Expanded(
              flex: 1,
              child: Text('${user.getDisplayedCategory()}',
                  style: Theme.of(context).textTheme.bodyText1)),
          Expanded(
              flex: 1,
              child: user.isCurrentUser
                  ? Text('')
                  : TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext ctx2) {
                              return SendPeppDialog(user.name);
                            });
                      },
                      child: Text('\u{1F4AA}',
                          style: Theme.of(context).textTheme.bodyText1)))
        ]));
  }
}

class SendPeppDialog extends StatelessWidget {
  String name;
  SendPeppDialog(this.name);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Wrap(children: [
      Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
              decoration: new BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border:
                      new Border.all(color: Theme.of(context).highlightColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Row(children: [
                      Flexible(
                          flex: 3,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Sjysst!',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      'Du har skickat en pepp till $name!'))
                            ],
                          )),
                      Flexible(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '\u{1F4AA}',
                                style: TextStyle(fontSize: 50),
                              )))
                    ])),
                Align(alignment: Alignment.topRight, child: CloseButton()),
              ])))
    ]));
  }
}
