import 'dart:math';

class Challenge {
  String title;
  String category;
  String description =
      "Dags att göra 10 burpees! Hoppa upp med händerna över huvudet, ta dig ner till en djup armhävningsposition och hoppa upp igen. Variera övningen med attt göra en situp eller sidoplankan.";
  bool completed = false;
  Challenge(this.title, this.category);
}

class ChallengesModel {
  static final List<String> categories = ['Fysisk', 'Social', 'Mental'];
  Map<String, List<Challenge>> challengesMap = {
    categories[0]: [
      Challenge('10 Pushups', 'Fysisk'),
      Challenge('10 Situps', 'Fysisk'),
      Challenge('10 burpees', 'Fysisk'),
      Challenge('5 Pushups', 'Fysisk'),
      Challenge('5 Situps', 'Fysisk'),
      Challenge('5 burpees', 'Fysisk')
    ],
    categories[1]: [Challenge('Lorem Ipsum', 'Social'), Challenge('asdasd', 'Social')],
    categories[2]: [
      Challenge('dasdsa', 'Mental'),
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
