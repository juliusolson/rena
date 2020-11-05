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
          Stack(children: [
            //Column(children: [
            Image(image: AssetImage(pinData.imageURL)),
            //   Align(
            //       alignment: Alignment.bottomCenter,
            //       child: Container(
            //           padding: EdgeInsets.all(5),
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: Colors.deepPurple[500],
            //           ),
            //           child: Text(
            //             'x${pinData.repeats}',
            //             style: Theme.of(context).textTheme.headline2,
            //           )))
            // ]),
            Align(alignment: Alignment.topRight, child: CloseButton())
          ]),
          Flexible(
              flex: 1,
              child: Text(pinData.title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1)),
          Container(
              padding: EdgeInsets.all(15),
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
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text('Uppnådd ${pinData.dateAcquired}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 12, color: Colors.grey)))
              ]))
        ]));
  }
}
