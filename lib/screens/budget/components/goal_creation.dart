import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rena/utils/colors.dart';
import 'package:rena/models/goalmodel.dart';

class GoalCreation extends StatefulWidget {
  Goals data;
  GoalCreation({this.data});

  @override
  _GoalCreationState createState() => _GoalCreationState();
}

class _GoalCreationState extends State<GoalCreation> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  _saveNewGoal(BuildContext ctx) {
    String name = nameController.text;
    int amount = int.parse(amountController.text);
    String description = descriptionController.text;

    Goal g = Goal(name, description, amount, 0,
        amount > 5000 ? GoalType.Dream : GoalType.Treat, 0);
    this.widget.data.addGoal(g);
    Navigator.of(context).pop(this.widget);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: CloseButton(
                              color: Colors.blue,
                            ))),
                    Flexible(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nytt Sparmål",
                              style: Theme.of(context).textTheme.headline1,
                            ))),
                    Flexible(
                        flex: 7,
                        child: Form(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Namn",
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  TextFormField(
                                      controller: nameController,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                      decoration: InputDecoration(
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .caption,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          )))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Belopp",
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: amountController,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                      decoration: InputDecoration(
                                          suffixText: "kr",
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .caption,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          )))
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Beskrivning",
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  TextFormField(
                                      controller: descriptionController,
                                      maxLines: 5,
                                      minLines: 5,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                      decoration: InputDecoration(
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .caption,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0),
                                          ))),
                                ]),
                            FlatButton(
                              minWidth: 200,
                              color: createMaterialColor(Color(0xff00d3b3)),
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              padding: EdgeInsets.all(8.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () => _saveNewGoal(context),
                              child: Text(
                                "Spara",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        )))
                  ],
                ))));
  }
}
