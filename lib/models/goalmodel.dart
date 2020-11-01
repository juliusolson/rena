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
