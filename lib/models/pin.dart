import 'dart:math';

class Pin {
  String title;
  String description;
  String dateAcquired;
  String imageURL;
  Pin(this.title, this.description, this.dateAcquired, this.imageURL);

  factory Pin.dummy() {
    Random rng = new Random();
    String date = rng.nextBool() ? '2020-10-02' : null;
    return new Pin(
        'Spelfri i 100 dagar',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        date,
        'images/medal.png');
  }
  bool isAcquied() {
    return dateAcquired != null;
  }
}
