import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rena/models/scoreBoard.dart';
import 'package:rena/screens/profile/components/pinsView.dart';
import 'package:rena/screens/profile/components/profileFeedView.dart';
import 'package:rena/screens/profile/components/topList.dart';

class SocialView extends StatelessWidget {
  final String str;

  SocialView(this.str);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Topplista',
                      style: Theme.of(context).textTheme.headline2))),
          Flexible(
              flex: 1,
              child: ChangeNotifierProvider<ProfileDummyData>(
                  create: (context) => ProfileDummyData(10),
                  child: Consumer<ProfileDummyData>(
                      builder: (context, value, child) {
                    return HighScoreList(value.userProfiles);
                  }))),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Pins',
                      style: Theme.of(context).textTheme.headline2))),
          Flexible(flex: 1, child: PinsView()),
        ]),
      ),
    );
  }
}
