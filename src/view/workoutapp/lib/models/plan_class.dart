class Plan {
  late String planName;
  late List exerciseNames;
  late List reps;
  late List weight;

  Plan({required this.planName, required this.exerciseNames, required this.reps, required this.weight});

  Plan.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    exerciseNames = json['exerciseNames'];
    reps = json['reps'];
    weight = json['weight'];
  }
}