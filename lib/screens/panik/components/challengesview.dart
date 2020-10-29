import 'package:flutter/material.dart';
import 'package:rena/models/challengesmodel.dart';

class Challenges extends StatefulWidget {
  final ChallengesModel dataModel;
  Challenges(this.dataModel);
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> challenges = widget.dataModel
        .getChallenges(ChallengesModel.categories[_selectedIndex], 3);
    return Container(
        color: Colors.blue,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Flexible(
              child: Text('Utmaningar',
                  style: Theme.of(context).textTheme.bodyText1)),
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ChallengesModel.categories.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return TextButton(
                        onPressed: () => {onCategorySelect(index)},
                        child: Text(ChallengesModel.categories[index],
                            style: Theme.of(context).textTheme.bodyText1));
                  })),
          Flexible(
              flex: 4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: challenges.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                        decoration: new BoxDecoration(
                            color: Colors.amber, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text(challenges[index],
                            style: Theme.of(context).textTheme.bodyText1));
                  }))
        ]));
  }

  void onCategorySelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
