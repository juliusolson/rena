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
  Goal(this.name, this.amount, this.saved, this.type);
}

List<Goal> dummyGoals = [
  Goal("Nya hörlurar", 1500, 300, GoalType.Treat),
  Goal("Finmiddag", 600, 100, GoalType.Treat),
  Goal("Macbook pro", 30000, 15000, GoalType.Dream),
  Goal("Resa till Mallorca", 20000, 13000, GoalType.Dream),
];
