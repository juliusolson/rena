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
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Align(
          alignment: Alignment.topLeft,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Utmaningar',
                  style: Theme.of(context).textTheme.headline1))),
      Flexible(
          flex: 7,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              itemCount: _challenges.length,
              controller: PageController(
                viewportFraction: 0.7,
                initialPage: 0,
              ),
              itemBuilder: (BuildContext ctx, int index) {
                return Column(children: [
                  Text(_challenges[index].category,
                      style: Theme.of(context).textTheme.bodyText1),
                  Expanded(
                      child: ChallengesViewChallengeWidget(_challenges[index]))
                ]);
              })),
      Flexible(
          flex: 1,
          child: Container(
              decoration: new BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TextButton(
                  onPressed: onCategorySelect,
                  child: Text(
                    'Generera nya',
                    style: Theme.of(context).textTheme.caption,
                  ))))
    ]);
  }

  void onCategorySelect() {
    List<Challenge> challenges = widget.dataModel.getRandomChallenges();
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
            margin: EdgeInsets.symmetric(vertical: 7),
            decoration: new BoxDecoration(
                border: Border.all(color: Theme.of(context).buttonColor),
                shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Align(
                alignment: Alignment.center,
                child: Text(challengeData.title,
                    style: Theme.of(context).textTheme.bodyText1))));
  }
}

class ChallengeDialog extends StatelessWidget {
  Challenge challengeData;
  ChallengeDialog(this.challengeData);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(children: [
                    Align(alignment: Alignment.topRight, child: CloseButton()),
                    Container(
                        width: 400,
                        height: 350,
                        decoration: new BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).buttonColor),
                            shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text('${this.challengeData.title}',
                            style: Theme.of(context).textTheme.bodyText1))
                  ]),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Utmaning',
                          style: Theme.of(context).textTheme.headline1)),
                  Flexible(
                      flex: 5,
                      child: Text('${this.challengeData.description}')),
                  Flexible(
                      flex: 1,
                      child: GestureDetector(
                          onTap: () {
                            this.challengeData.completed = true;
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            decoration: new BoxDecoration(
                                color: Theme.of(context).highlightColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              'Avklarad',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          )))
                ])));
  }
}
