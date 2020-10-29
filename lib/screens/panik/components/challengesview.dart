import 'package:flutter/material.dart';
import 'package:rena/models/challengesmodel.dart';

class Challenges extends StatefulWidget {
  final ChallengesModel dataModel;
  Challenges(this.dataModel);
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  int _selectedIndex;
  List<String> challenges;
  @override
  void initState() {
    onCategorySelect(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Flexible(
          flex: 2,
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Utmaningar',
                  style: Theme.of(context).textTheme.headline1))),
      Flexible(
          flex: 2,
          child: Align(
              alignment: Alignment.topLeft,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ChallengesModel.categories.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return TextButton(
                        onPressed: () => {onCategorySelect(index)},
                        child: Text(ChallengesModel.categories[index],
                            style: (index != _selectedIndex)
                                ? Theme.of(context).textTheme.headline2
                                : Theme.of(context).textTheme.headline3));
                  }))),
      Flexible(
          flex: 7,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              itemCount: challenges.length,
              controller: PageController(
                viewportFraction: 0.8,
                initialPage: 0,
              ),
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                    decoration: new BoxDecoration(
                        border: Border.all(color: Colors.white),
                        shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Text(challenges[index],
                        style: Theme.of(context).textTheme.bodyText1));
              })),
      Flexible(
          flex: 1,
          child: Container(
              decoration: new BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TextButton(
                  onPressed: () {
                    onCategorySelect(_selectedIndex);
                  },
                  child: Text(
                    'Generera nya',
                    style: Theme.of(context).textTheme.caption,
                  ))))
    ]));
  }

  void onCategorySelect(int index) {
    List<String> challenges =
        widget.dataModel.getChallenges(ChallengesModel.categories[index], 3);
    setState(() {
      this._selectedIndex = index;
      this.challenges = challenges;
    });
  }
}
