import 'package:flutter/material.dart';
import 'package:rena/models/scoreBoard.dart';
import 'package:rena/screens/profile/components/profileView.dart';

class HighScoreList extends StatefulWidget {
  final List<String> categories = ['Spelfria dagar', 'Pins'];
  final List<ProfileEntry> users;
  HighScoreList(this.users);
  @override
  _HighScoreListState createState() => _HighScoreListState();
}

class _HighScoreListState extends State<HighScoreList> {
  int _selectedIndex;
  PageController _pageController =
      PageController(viewportFraction: 1, initialPage: 0);

  @override
  void initState() {
    super.initState();
    _selectSorting(0);
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themeActive = Theme.of(context).textTheme.bodyText1;

    TextStyle themeInactive = themeActive.copyWith(
      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.6),
    );

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
                          ? themeInactive
                          : themeActive),
                  onPressed: () {
                    _pageController.animateToPage(index,
                        curve: Curves.bounceIn,
                        duration: Duration(milliseconds: 200));
                  },
                );
              })),
      Flexible(
          flex: 3,
          child: Scrollbar(
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: widget.categories.length,
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      this._selectedIndex = page;
                    });
                  },
                  itemBuilder: (BuildContext ctx, int index) {
                    return _getHighScoreListView(index);
                  })))
    ]);
  }

  Widget _getHighScoreListView(int categoryIndex) {
    _selectSorting(categoryIndex);
    List<Widget> widgets = new List();
    for (var i = 0; i < widget.users.length; i++) {
      //debugPrint('$i : ${widget.users[i]}');
      widgets.add(GestureDetector(
          onTap: () {
            debugPrint('Open profile');
            showDialog(
                context: context,
                builder: (context) {
                  return ProfileView(widget.users[i]);
                });
          },
          child: HighScoreEntry(widget.users[i], i, categoryIndex)));
    }
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context)
            .scaffoldBackgroundColor
            .withOpacity(0.5), //Theme.of(context).colorScheme.background,
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
  }
}

class HighScoreEntry extends StatelessWidget {
  final ProfileEntry user;
  final int index;
  final int categoryIndex;
  HighScoreEntry(this.user, this.index, this.categoryIndex);
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
                  foregroundColor: Colors.white,
                  child: Text(user.getStringAvatar()))),
          Spacer(),
          Expanded(
              flex: 4,
              child: Text('${user.name}',
                  style: Theme.of(context).textTheme.bodyText2)),
          Expanded(
              flex: 1,
              child: Text('${user.getDisplayedCategory(this.categoryIndex)}',
                  style: Theme.of(context).textTheme.caption)),
          Expanded(
              flex: 1, child: user.isCurrentUser ? Text('') : PeppButton(user))
        ]));
  }
}

class SendPeppDialog extends StatelessWidget {
  final String name;
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
                          child:
                              Text('\u{1F4AA}', style: TextStyle(fontSize: 50)))
                    ])),
                Align(alignment: Alignment.topRight, child: CloseButton()),
              ])))
    ]));
  }
}

class PeppButton extends StatefulWidget {
  final ProfileEntry user;
  PeppButton(this.user);
  @override
  _PeppButtonState createState() => _PeppButtonState();
}

class _PeppButtonState extends State<PeppButton> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    Widget peppIcon = TextButton(
        onPressed: () {
          if (!_pressed) {
            showDialog(
                context: context,
                builder: (BuildContext ctx2) {
                  return SendPeppDialog(widget.user.name);
                });
          }
          setState(() {
            _pressed = true;
          });
        },
        child: Text(
          '\u{1F4AA}',
          style: TextStyle(fontSize: 28),
        ));
    if (_pressed) {
      peppIcon = ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcATop),
          child: peppIcon);
    }
    return peppIcon;
  }
}
