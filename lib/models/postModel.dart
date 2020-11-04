import 'package:rena/models/scoreBoard.dart';

class PostsModel{
  List<PostModel> posts = [PostModel('lorem ipsasdasdas', new ProfileEntry('Namn Namnsson', 30, 10)),
  PostModel('lorem iasdas', new ProfileEntry('Nn Namnsson', 30, 10)),
  PostModel('lorem ipasas', new ProfileEntry('amn Namnsson', 30, 10))];
}

class PostModel{
  String textBody;
  String date = 'Okt 2, 2020';
  int fistBumps = 3, heartEyes = 5; 
  ProfileEntry profile;
  PostModel(this.textBody, this.profile);
}