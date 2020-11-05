import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileEntry {
  String name;
  int gamblingFreeDays;
  int numberOfPins;
  int displayedScore = 0;
  Color color = Colors.lightBlue;
  bool isCurrentUser = false;
  ProfileEntry(this.name, this.gamblingFreeDays, this.numberOfPins);

  String toString() {
    return '$name| $gamblingFreeDays $numberOfPins';
  }

  //To be Removed. Ugly hack to easily change presented value when changing sorting mode of  high score
  int getDisplayedCategory() {
    return displayedScore;
  }

  void setDisplayedCategory(int index) {
    if (index == 0) {
      displayedScore = gamblingFreeDays;
    } else {
      displayedScore = numberOfPins;
    }
  }

  String getStringAvatar() {
    return name[0];
  }

  factory ProfileEntry.fromJson(Map<String, dynamic> json) {
    return ProfileEntry(
      json["name"] as String,
      json["days"] as int,
      json["pins"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": this.name,
      "days": this.gamblingFreeDays,
      "pins": this.numberOfPins,
    };
  }
}

class ProfileDummyData extends ChangeNotifier {
  static final List<String> usernames = [
    'Bwipo',
    'Ivanka',
    'Jane Doe',
    'Sasha',
    'Chen Yu',
    'Emelie',
    'Julius',
    'Philip',
    'Carl',
    'Emma'
  ];
  static final List<Color> colors = [
    Color(0xFFED1E79),
    Color(0xFFFBAE17),
    Color(0xFFF15A24),
    Color(0xFF7EC5FF),
    Color(0xFF8333FF),
    Color(0xFF00D3b3)
  ];
  List<ProfileEntry> userProfiles;

  ProfileDummyData(int numberOfUsers) {
    userProfiles = _createDummyData(numberOfUsers);
    debugPrint('Creating Dummy Profiles');
    debugPrint(userProfiles.toString());
    notifyListeners();
  }
  List<ProfileEntry> _createDummyData(int numberOfUsers) {
    Random rng = new Random();
    List<ProfileEntry> users = new List(numberOfUsers);
    for (var i = 0; i < numberOfUsers; i++) {
      String name = usernames[rng.nextInt(usernames.length)];
      users[i] = new ProfileEntry(name, rng.nextInt(100), rng.nextInt(30));
      users[i].color = colors[rng.nextInt(colors.length)];
    }
    users[rng.nextInt(users.length)].isCurrentUser = true;
    return users;
  }
}
