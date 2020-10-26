import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rena/models/scoreBoard.dart';
import 'package:rena/screens/profile/components/pins.dart';
import 'package:rena/screens/profile/components/topList.dart';

class ProfileView extends StatelessWidget {
  final String str;

  ProfileView(this.str);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Flexible(
              flex: 1,
              child: Text('Topplista',
                  style: Theme.of(context).textTheme.bodyText1)),
          Flexible(
              flex: 10,
              child: ChangeNotifierProvider<ProfileDummyData>(
                  create: (context) => ProfileDummyData(10),
                  child: Consumer<ProfileDummyData>(
                      builder: (context, value, child) {
                    return HighScoreList(value.userProfiles);
                  }))),
          Flexible(
              flex: 1,
              child: Text(
                'Pins',
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Flexible(
              flex: 10,
              child: Pins(['Streaks', 'Sparmål', 'Interaktion', 'Övrigt']))
        ]),
      ),
    );
  }
}
