import 'package:flutter/material.dart';
import 'package:rena/utils/colors.dart';

class BudgetOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Budgetar",
              style: Theme.of(context).textTheme.headline2,
            ),
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
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Spelat för",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "0 kr",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Kvar",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "150 kr",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
        // FlatButton(
        //   color: createMaterialColor(Color(0xff00d3b3)),
        //   textColor: Colors.white,
        //   disabledColor: Colors.grey,
        //   padding: EdgeInsets.all(8.0),
        //   shape: RoundedRectangleBorder(
        //       borderRadius: new BorderRadius.circular(30.0)),
        //   onPressed: () {
        //     showDialog(
        //         context: context,
        //         builder: (_) {
        //           return BudgetChangeView();
        //         });
        //   },
        //   child: Text(
        //     "    Ändra fördelning    ",
        //     style: Theme.of(context).textTheme.caption,
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 5, right: 5),
        //   child: Divider(
        //     thickness: 2.0,
        //     color: Colors.grey,
        //   ),
        // ),
      ],
    ));
  }
}
