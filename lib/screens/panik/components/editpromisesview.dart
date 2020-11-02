import 'package:flutter/material.dart';
import 'package:rena/models/promisemodel.dart';

class EditPromisesDialog extends StatefulWidget {
  final Promises promises;
  EditPromisesDialog(this.promises);
  @override
  _EditPromisesDialogState createState() => _EditPromisesDialogState();
}

class _EditPromisesDialogState extends State<EditPromisesDialog> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text('Ändra löften',
                  style: Theme.of(context).textTheme.headline2)),
          Flexible(
              child: ListView.builder(
                  itemCount: widget.promises.promises.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return (EditPromiseCard());
                  })),
          Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).highlightColor),
              child: TextButton(onPressed: () {}, child: Text('Spara')))
        ]));
  }
}

class EditPromiseCard extends StatefulWidget {
  @override
  _EditPromiseCardState createState() => _EditPromiseCardState();
}

class _EditPromiseCardState extends State<EditPromiseCard> {
  Promise promise;
  String promiseText =
      "Losadasdasdasdas asdas asd asda asdasd asdasd asda asdf";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: new BoxDecoration(
                color: Theme.of(context).hintColor, shape: BoxShape.circle),
            child: Icon(Icons.delete_forever_outlined,
                color: Theme.of(context).scaffoldBackgroundColor)),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).hintColor)),
              child: Stack(children: [
                Text(
                  promiseText,
                  maxLines: 2,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).highlightColor),
                        transform: Matrix4.translationValues(28, 20, 0),
                        child: Icon(
                          Icons.edit,
                          color: Theme.of(context).hintColor,
                          size: 36,
                        ))),
              ])),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.menu,
              color: Theme.of(context).hintColor,
            ))
      ],
    );
  }
}
