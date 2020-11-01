import 'dart:collection';

class Challenge {
  String title;
  String description =
      "Dags att göra 10 burpees! Hoppa upp med händerna över huvudet, ta dig ner till en djup armhävningsposition och hoppa upp igen. Variera övningen med attt göra en situp eller sidoplankan.";
  bool completed = false;
  Challenge(this.title);
}

class ChallengesModel {
  static final List<String> categories = ['Fysisk', 'Social', 'Mental'];
  Map<String, List<Challenge>> challengesMap = {
    categories[0]: [
      Challenge('10 Pushups'),
      Challenge('10 Situps'),
      Challenge('10 burpees'),
      Challenge('5 Pushups'),
      Challenge('5 Situps'),
      Challenge('5 burpees')
    ],
    categories[1]: [Challenge('Lorem Ipsum'), Challenge('asdasd')],
    categories[2]: [
      Challenge('dasdsa'),
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
}
