import 'package:flutter/widgets.dart';

class Pin {
  String title;
  String description;
  String dateAcquired;
  String imageURL;
  Pin(this.title, this.description, this.dateAcquired, this.imageURL);

  factory Pin.dummy() {
    return new Pin(
        'Spelfri i 100 dagar',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        '2020-10-02',
        'images/medal.png');
  }
}
