import 'package:flutter/material.dart';

class Promises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Flexible(
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mina löften',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline1,
              ))),
      Flexible(flex: 4, child: getPromisesWidget(context))
    ]);
  }

  Widget getPromisesWidget(BuildContext context) {
    Widget editButtons = Column(children: [
      Expanded(
          child: Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).highlightColor),
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return PromiseCreationDialog();
                        });
                  },
                  child: Text('Ny påminnelse',
                      style: Theme.of(context).textTheme.caption)))),
      Expanded(
          child: Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).highlightColor),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextButton(
                  onPressed: () {},
                  child: Text('Redigera',
                      style: Theme.of(context).textTheme.caption))))
    ]);
    return editButtons;
  }
}

class PromiseCreationDialog extends StatefulWidget {
  @override
  _PromiseCreationDialogState createState() => _PromiseCreationDialogState();
}

class _PromiseCreationDialogState extends State<PromiseCreationDialog> {
  String textBody;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(child: Text('Nytt löfte')),
                Flexible(
                  child: Stack(children: [
                    Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Theme.of(context).hintColor))),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).highlightColor),
                            child: Icon(
                              Icons.edit,
                              color: Theme.of(context).hintColor,
                              size: 50,
                            )))
                  ]),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Beskrivning')),
                Flexible(
                    child: Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Theme.of(context).hintColor)),
                        child: TextField(
                          maxLines: 5,
                          minLines: 5,
                          style: Theme.of(context).textTheme.caption,
                        ))),
                Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).highlightColor),
                    child: TextButton(onPressed: () {}, child: Text('Spara')))
              ],
            ),
            Align(alignment: Alignment.topRight, child: CloseButton())
          ],
        ));
  }
}
