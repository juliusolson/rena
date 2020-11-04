import 'package:flutter/material.dart';
import 'package:rena/models/challengesmodel.dart';
import 'package:rena/screens/panik/components/challengesview.dart';
import 'package:rena/screens/panik/components/promisesview.dart';

class PanikView extends StatelessWidget {
  final String str;

  PanikView(this.str);

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Flexible(flex: 3, child: PromisesView()),
      Divider(
        color: Colors.grey,
        height: 10,
        thickness: 3,
        indent: 10,
        endIndent: 10,
      ),
      Flexible(flex: 4, child: Challenges(ChallengesModel()))
    ]);
  }
}
