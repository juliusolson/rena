import 'dart:math';

class Pins{
  List<Pin> pins = [Pin('Spelfri i 7 dagar', 
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        '2020-10-02',
        'images/streak_7d1-512.png'),
        Pin(
        'Spelfri i 15 dagar', 
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        '2020-10-02',
        'images/streak_15dstar-512.png'),
        Pin('Spelfri i 30 dagar', 
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        '2020-10-02',
        'images/streak_30d-512.png'),
        Pin('Spelfri i 60 dagar', 
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        '2020-10-02',
        'images/streak_60d-512.png'),
        Pin('Spelfri i 100 dagar', 
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        '2020-10-02',
        'images/streak_100d-512.png')];
    Pins(){
      for (var i = 0; i < 10; i++) {
        pins.add(Pin.dummy());
      }
    }
}
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

  factory Pin.fromJson(Map<String, dynamic> json) {
    return Pin(
      json["title"] as String,
      json["description"] as String,
      json["date"] as String,
      json["url"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "title": this.title,
      "description": this.description,
      "date": this.dateAcquired,
      "url": this.imageURL,
    };
  }
}
