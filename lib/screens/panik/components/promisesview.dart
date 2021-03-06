import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rena/models/promisemodel.dart';
import 'package:rena/screens/panik/components/editpromisesview.dart';

class PromisesView extends StatefulWidget {
  @override
  _PromisesViewState createState() => _PromisesViewState();
}

class _PromisesViewState extends State<PromisesView> {
  Promises promises = new Promises();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Promises>.value(
        value: promises,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Mina löften',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline1)),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            Widget dialog = PromiseCreationDialog();
                            return ChangeNotifierProvider<Promises>.value(
                                value: promises, child: dialog);
                          });
                    },
                    child: Container(
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).highlightColor),
                        child: Icon(Icons.add, size: 50)))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            Widget dialog = EditPromisesDialog();
                            return ChangeNotifierProvider<Promises>.value(
                                value: promises, child: dialog);
                          });
                    },
                    child: Container(
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).highlightColor),
                        child: Icon(Icons.edit, size: 50))))
          ]),
          Flexible(
              flex: 4,
              child: Consumer<Promises>(builder: (context, promises, child) {
                return ListView.builder(
                    itemCount: promises.promises.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).shadowColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(promises.promises[index].body,
                              style: Theme.of(context).textTheme.caption));
                    });
              }))
        ]));
  }
}

class PromiseCreationDialog extends StatefulWidget {
  @override
  _PromiseCreationDialogState createState() => _PromiseCreationDialogState();
}

class _PromiseCreationDialogState extends State<PromiseCreationDialog> {
  String textBody;
  int charCount, maxCount = 300;
  @override
  void initState() {
    textBody = '';
    charCount = textBody.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: 
            Column(
              children: [
                Align(alignment: Alignment.topRight, child: CloseButton()),
                Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 2,
                    child: Text(
                      'Nytt löfte',
                      style: Theme.of(context).textTheme.headline2,
                    )),
                Flexible(
                  child: Stack(children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Theme.of(context).shadowColor))),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).highlightColor),
                            child: Icon(
                              Icons.edit,
                              color: Theme.of(context).buttonColor,
                              size: 50,
                            )))
                  ]),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'Beskrivning',
                          style: Theme.of(context).textTheme.caption,
                        ))),
                Flexible(
                    flex: 2,
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Theme.of(context).shadowColor)),
                        child: TextField(
                          decoration: InputDecoration(labelText: this.textBody),
                          onChanged: (String text) {
                            setState(() {
                              this.charCount = text.length;
                              this.textBody = text;
                            });
                          },
                          maxLines: 8,
                          minLines: 5,
                          style: Theme.of(context).textTheme.caption,
                        ))),
                Align(
                    alignment: Alignment.topRight,
                    child: Text('$charCount / $maxCount tecken',
                        style: Theme.of(context).textTheme.caption)),
                Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).highlightColor),
                    child: TextButton(
                        onPressed: () {
                          savePromise(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Spara',
                          style: Theme.of(context).textTheme.caption,
                        )))
              ],
            ),
            
          
        );
  }

  void savePromise(BuildContext context) {
    Provider.of<Promises>(context, listen: false).addPromise(this.textBody);
  }
}
