import 'package:flutter/material.dart';

class BudgetView extends StatelessWidget {
  final String str;

  BudgetView(this.str);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                  color: Colors.blue,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Budgetar",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: null,
                              child: Text(
                                "Spar",
                                style: Theme.of(context).textTheme.caption,
                              )),
                          TextButton(
                              onPressed: null,
                              child: Text(
                                "Spel",
                                style: Theme.of(context).textTheme.caption,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Spelat för",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            "0 kr",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Kvar",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            "150 kr",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      FlatButton(
                        color: Colors.grey,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        padding: EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {},
                        child: Text(
                          "Ändra fördelning",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      )
                    ],
                  )),
            ),
            Flexible(
                flex: 3,
                child: Container(
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
