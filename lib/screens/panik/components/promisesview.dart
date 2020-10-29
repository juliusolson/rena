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
                style: Theme.of(context).textTheme.bodyText1,
              ))),
      Flexible(
          flex: 4,
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 12),
              )))
    ]);
  }
}
