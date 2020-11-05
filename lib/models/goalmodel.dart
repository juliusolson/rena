import 'package:flutter/material.dart';

enum GoalType {
  Dream,
  Treat,
}

class Goal {
  String name;
  String description;
  int amount;
  int saved;
  GoalType type;
  Goal(this.name, this.description, this.amount, this.saved, this.type);

  factory Goal.fromJson(Map<String, dynamic> json) {
    GoalType type;
    switch (json["type"] as String) {
      case "dream":
        type = GoalType.Dream;
        break;
      case "treat":
        type = GoalType.Treat;
        break;
      default:
        type = GoalType.Dream;
    }
    return Goal(
      json["name"] as String,
      json["description"] as String,
      json["amount"] as int,
      json["saved"] as int,
      type,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": this.name,
      "description": this.description,
      "amount": this.amount,
      "saved": this.saved,
      "type": this.type == GoalType.Dream ? "dream" : "treat",
    };
  }
}

List<Goal> dummyGoals = [
  Goal("Nya hörlurar", "Bose NC700", 1500, 300, GoalType.Treat),
  Goal("Finmiddag", "Middag med familjen", 600, 100, GoalType.Treat),
  Goal("Macbook pro", "i7, 16 gb ram, 512 gb ssd, 13 tum", 30000, 15000,
      GoalType.Dream),
  Goal(
      "Resa till Mallorca",
      "Resa med familjen till Mallorca, bo på fint hotell och leva gott",
      20000,
      13000,
      GoalType.Dream),
];

class Goals extends ChangeNotifier {
  List<Goal> goals;
  Goals() {
    this.goals = dummyGoals;
  }

  void addGoal(Goal g) {
    this.goals.add(g);
    this.notifyListeners();
  }

  void deleteGoal(Goal g) {
    this.goals.remove(g);
    notifyListeners();
  }

  void updateGoal(Goal g, int index) {
    this.goals[index] = g;
    notifyListeners();
  }
}