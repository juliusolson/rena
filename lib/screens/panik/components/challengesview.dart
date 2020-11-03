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
  List<Challenge> _challenges;
  @override
  void initState() {
    onCategorySelect();
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
      /*Flexible(
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
                  }))),*/
      Flexible(
          flex: 7,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              itemCount: _challenges.length,
              controller: PageController(
                viewportFraction: 0.8,
                initialPage: 0,
              ),
              itemBuilder: (BuildContext ctx, int index) {
                return ChallengesViewChallengeWidget(_challenges[index]);
              })),
      Flexible(
          flex: 1,
          child: Container(
              decoration: new BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TextButton(
                  onPressed: () {
                    onCategorySelect();
                  },
                  child: Text(
                    'Generera nya',
                    style: Theme.of(context).textTheme.caption,
                  ))))
    ]));
  }

  void onCategorySelect() {
    List<Challenge> challenges =
        widget.dataModel.getRandomChallenges();
    setState(() {
      //this._selectedIndex = index;
      this._challenges = challenges;
    });
  }
}

class ChallengesViewChallengeWidget extends StatelessWidget {
  Challenge challengeData;
  ChallengesViewChallengeWidget(this.challengeData);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return ChallengeDialog(this.challengeData);
              });
        },
        child: Container(
            decoration: new BoxDecoration(
                //color: (challengeData.completed) ? Colors.green : Colors.red,
                border: Border.all(color: Theme.of(context).hintColor),
                shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Align(alignment: Alignment.center,
             child:Column(children: [Text(challengeData.category, style: Theme.of(context).textTheme.headline2),
              Text(challengeData.title,
                style: Theme.of(context).textTheme.bodyText1)]))));
  }
}

class ChallengeDialog extends StatelessWidget {
  Challenge challengeData;
  ChallengeDialog(this.challengeData);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Stack(children: [
            Align(alignment: Alignment.topRight, child: CloseButton()),
            Container(
                width: 400,
                height: 350,
                decoration: new BoxDecoration(
                    border: Border.all(color: Theme.of(context).hintColor),
                    shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text('${this.challengeData.title}',
                    style: Theme.of(context).textTheme.bodyText1))
          ]),
          Align(
              alignment: Alignment.topLeft,
              child: Text('Utmaning',
                  style: Theme.of(context).textTheme.headline1)),
          Flexible(flex: 5, child: Text('${this.challengeData.description}')),
          Flexible(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    this.challengeData.completed = true;
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    decoration: new BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      'Avklarad',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )))
        ]));
  }
}
