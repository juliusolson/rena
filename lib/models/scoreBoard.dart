import 'dart:math';

import 'package:flutter/widgets.dart';

class ProfileEntry {
  String name;
  int gamblingFreeDays;
  int numberOfPins;
  ProfileEntry(this.name, this.gamblingFreeDays, this.numberOfPins);

  String toString() {
    return '${name}| ${gamblingFreeDays} ${numberOfPins}';
  }

  //To be Removed. Ugly hack to easily change presented value when changing sorting mode of  high score
  int getCategory(int index) {
    if (index == 0) {
      return gamblingFreeDays;
    } else {
      return numberOfPins;
    }
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
    }
    return users;
  }
}
