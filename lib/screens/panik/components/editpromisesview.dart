import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rena/models/promisemodel.dart';
import 'package:rena/theme/icons.dart';

class EditPromisesDialog extends StatefulWidget {
  // final Promises promises;
  // EditPromisesDialog(this.promises);
  @override
  _EditPromisesDialogState createState() => _EditPromisesDialogState();
}

class _EditPromisesDialogState extends State<EditPromisesDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(children: [
          Column(children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text('Ändra löften',
                    style: Theme.of(context).textTheme.headline2)),
            Flexible(
                child: Consumer<Promises>(builder: (context, promises, child) {
              return ListView.builder(
                  itemCount: promises.promises.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return (EditPromiseCard(promises, index));
                  });
            })),
          ]),
          Align(alignment: Alignment.topRight, child: CloseButton())
        ]));
  }
}

class EditPromiseCard extends StatefulWidget {
  final Promises promises;
  final int index;
  EditPromiseCard(this.promises, this.index);
  @override
  _EditPromiseCardState createState() => _EditPromiseCardState();
}

class _EditPromiseCardState extends State<EditPromiseCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: new BoxDecoration(
                color: Theme.of(context).shadowColor, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(Icons.delete_forever_outlined,
                  color: Theme.of(context).scaffoldBackgroundColor),
              onPressed: _deletePromise,
            )),
        Expanded(
            child: Stack(children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).shadowColor)),
              child: Text(widget.promises.promises[widget.index].body)),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).highlightColor),
                  transform: Matrix4.translationValues(23, 10, 0),
                  child: IconButton(
                      onPressed: () {
                        _showPromiseEditDialog(context);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).buttonColor,
                        size: 36,
                      ))))
        ])),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: Icon(
                CustomIcons.dot_3,
                color: Theme.of(context).shadowColor,
              ),
              onPressed: () {},
            ))
      ],
    );
  }

  void _showPromiseEditDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Widget dialog =
              PromiseEditDialog(widget.promises.promises[widget.index]);
          return ChangeNotifierProvider.value(
              value: widget.promises, child: dialog);
        });
  }

  void _deletePromise() {
    Provider.of<Promises>(context, listen: false)
        .deletePromise(widget.promises.promises[widget.index]);
  }
}

class PromiseEditDialog extends StatefulWidget {
  Promise promise;
  PromiseEditDialog(this.promise);
  @override
  _PromiseEditDialogState createState() => _PromiseEditDialogState();
}

class _PromiseEditDialogState extends State<PromiseEditDialog> {
  int charCount, maxCount = 300;
  TextEditingController _controller;
  @override
  void initState() {
    _controller = new TextEditingController();
    _controller.text = widget.promise.body;
    charCount = _controller.text.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 2,
                    child: Text(
                      'Ändra löfte',
                      style: Theme.of(context).textTheme.headline2,
                    )),
                Flexible(
                  child: Stack(children: [
                    Container(
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
                    child: Text(
                      'Beskrivning',
                      style: Theme.of(context).textTheme.caption,
                    )),
                Flexible(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Theme.of(context).shadowColor)),
                        child: TextField(
                          autofocus: true,
                          controller: _controller,
                          onChanged: (text) {
                            setState(() {
                              charCount = text.length;
                            });
                          },
                          maxLines: 8,
                          minLines: 3,
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
                          editPromise(context, _controller.text);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Spara',
                          style: Theme.of(context).textTheme.caption,
                        )))
              ],
            ),
            Align(alignment: Alignment.topRight, child: CloseButton())
          ],
        ));
  }

  void editPromise(BuildContext context, String newBody) {
    Provider.of<Promises>(context, listen: false)
        .editPromise(widget.promise, newBody);
  }
}
