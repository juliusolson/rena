import 'dart:math';

class Challenge {
  String title;
  String category;
  String imageURL;
  String description =
      "Dags att göra 10 burpees! Hoppa upp med händerna över huvudet, ta dig ner till en djup armhävningsposition och hoppa upp igen. Variera övningen med attt göra en situp eller sidoplankan.";
  bool completed = false;
  Challenge(this.title, this.category, this.imageURL);
}

class ChallengesModel {
  static final List<String> categories = ['Fysisk', 'Social', 'Mental'];
  Map<String, List<Challenge>> challengesMap = {
    categories[0]: [
      Challenge('10 Pushups', 'Fysisk', 'images/fysisk-utmaning2.jpg'),
      Challenge('10 Situps', 'Fysisk', 'images/fysisk-utmaning2.jpg'),
      Challenge('10 burpees', 'Fysisk', 'images/fysisk-utmaning2.jpg'),
      Challenge('5 Pushups', 'Fysisk', 'images/fysisk-utmaning.jpg'),
      Challenge('5 Situps', 'Fysisk', 'images/fysisk-utmaning.jpg'),
      Challenge('5 burpees', 'Fysisk', 'images/fysisk-utmaning.jpg')
    ],
    categories[1]: [
      Challenge('Social 1', 'Social', 'images/social-utmaning.jpg'),
      Challenge('Social 2', 'Social', 'images/social-utmaning2.jpg'),
      Challenge('Social 3', 'Social', 'images/social-utmaning.jpg')
    ],
    categories[2]: [
      Challenge('Mental 1', 'Mental', 'images/mental-utmaning.jpeg'),
      Challenge('Mental 2', 'Mental', 'images/mental-utmaning.jpeg'),
      Challenge('Mental 3', 'Mental', 'images/mental-utmaning.jpeg'),
    ]
  };

  List<Challenge> getChallenges(String category, int numChallanges) {
    List<Challenge> result;
    List<Challenge> selectedChallenges = challengesMap[category];
    if (selectedChallenges.length <= numChallanges) {
      result = selectedChallenges;
    } else {
      result = new List<Challenge>.from(selectedChallenges);
      result.shuffle();
      result = result.take(numChallanges).toList();
    }
    return result;
  }

  List<Challenge> getRandomChallenges() {
    Random rng = new Random();
    List<Challenge> challenges;
    List<Challenge> result = new List();
    for (var category in categories) {
      challenges = this.challengesMap[category];
      result.add(challenges[rng.nextInt(challenges.length)]);
    }
    return result;
  }
}
