import 'dart:math';

class Pins {
  List<String> pinCategories = ['Streaks', 'Sparmål', 'Interaktion', 'Övrigt'];
  List<List<Pin>> pins = [
    [
      Pin(
          'Spelfri i 7 dagar',
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
          '2020-10-02',
          'images/streak_7d1-512.png'),
      Pin(
          'Spelfri i 15 dagar',
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
          '2020-10-02',
          'images/streak_15dstar-512.png'),
      Pin(
          'Spelfri i 30 dagar',
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
          '2020-10-02',
          'images/streak_30d-512.png'),
      Pin(
          'Spelfri i 60 dagar',
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
          '2020-10-02',
          'images/streak_60d-512.png'),
      Pin(
          'Spelfri i 100 dagar',
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
          '2020-10-02',
          'images/streak_100d-512.png')
    ],
    [],
    [],
    []
  ];
  Pins() {
    for (var i = 0; i < 11; i++) {
      for (var j = 0; j < this.pinCategories.length; j++) {
        pins[j].add(Pin.dummy());
      }
    }
  }
}

class Pin {
  String title;
  String description;
  String dateAcquired;
  String imageURL;
  int repeats = 2;
  Pin(this.title, this.description, this.dateAcquired, this.imageURL);

  factory Pin.dummy() {
    Pin pin = new Pin(
        'Spelfri i 100 dagar',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod  tincidunt ut laoreet dolore magna aliquam',
        null,
        'images/streak_100d-512.png');

    return pin;
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
