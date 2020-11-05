import 'package:flutter/material.dart';
import 'package:rena/models/scoreBoard.dart';
import 'package:rena/screens/profile/components/pinsView.dart';
import 'package:rena/screens/profile/components/profileFeedView.dart';

class ProfileView extends StatefulWidget {
  final ProfileEntry user;
  ProfileView(this.user);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Align(alignment: Alignment.topRight, child: CloseButton()),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).hintColor),
                borderRadius: BorderRadius.circular(35)),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.user.name,
                  style: Theme.of(context).textTheme.headline2,
                )),
          )),
          Row(children: [
            TextButton(
                onPressed: () {
                  _selectIndex(0);
                },
                child: Text(
                  'Pins',
                  style: (_selectedIndex == 0)
                      ? Theme.of(context).textTheme.headline3
                      : Theme.of(context).textTheme.headline2,
                )),
            TextButton(
                onPressed: () {
                  _selectIndex(1);
                },
                child: Text(
                  'Inlägg',
                  style: (_selectedIndex == 1)
                      ? Theme.of(context).textTheme.headline3
                      : Theme.of(context).textTheme.headline2,
                ))
          ]),
          Expanded(
              flex: 2,
              child: (_selectedIndex == 0) ? PinsView() : ProfileFeedView())
        ],
      ),
    );
  }

  void _selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
