import 'package:flutter/material.dart';
import 'package:rena/models/pin.dart';

class PinInfo extends StatelessWidget {
  Pin pinData;
  PinInfo(this.pinData);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Flexible(
              flex: 1,
              child: CloseButton(
                color: Colors.blue,
              )),
          Flexible(flex: 4, child: Image(image: AssetImage(pinData.imageURL))),
          Flexible(
              flex: 1,
              child: Text(pinData.title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1)),
          Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(children: [
                Text(pinData.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 12)),
                Text('Uppnådd ${pinData.dateAcquired}',
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 12, color: Colors.grey))
              ]))
        ]));
  }
}
