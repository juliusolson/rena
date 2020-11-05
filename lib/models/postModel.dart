import 'package:rena/models/scoreBoard.dart';
import 'dart:math';

class PostsModel {
  List<PostModel> posts;

  PostsModel(ProfileEntry user) {
    posts = [
      PostModel('lorem ipsasdasdas', user, 'Okt 22 2020', 3, 1, 1,
          'images/streak_100d-512.png'),
      PostModel('lorem iasdas', user, 'Okt 10 2020', 2, 2, 2, null),
      PostModel('lorem ipasas', user, 'Sep 22 2020', 5, 1, 1,
          'images/streak_30d-512.png')
    ];
  }
}

class PostModel {
  String textBody;
  String date;
  String imageUrl;
  int fistBumps, heartEyes, rainbows;
  ProfileEntry profile;
  PostModel(this.textBody, this.profile, this.date, this.fistBumps,
      this.heartEyes, this.rainbows, this.imageUrl);
}
