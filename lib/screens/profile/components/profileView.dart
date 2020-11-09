import 'package:flutter/material.dart';
import 'package:rena/models/postModel.dart';
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
    TextStyle themeActive = Theme.of(context).textTheme.bodyText1;

    TextStyle themeInactive = themeActive.copyWith(
      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.6),
    );

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
                borderRadius: BorderRadius.circular(35),
                image: widget.user.imageURL != null ? DecorationImage(image: AssetImage(widget.user.imageURL), fit: BoxFit.cover) : null,),
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
                  style: (_selectedIndex == 0) ? themeActive : themeInactive,
                )),
            TextButton(
                onPressed: () {
                  _selectIndex(1);
                },
                child: Text(
                  'Inlägg',
                  style: (_selectedIndex == 1) ? themeActive : themeInactive,
                ))
          ]),
          Expanded(
              flex: 2,
              child: (_selectedIndex == 0)
                  ? PinsView()
                  : ProfileFeedView(PostsModel(widget.user)))
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
