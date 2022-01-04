class Plan {
  late String planName;
  late List exerciseNames;
  late List reps;
  late List weight;
  int totalVolume = 0;

  Plan({required this.planName, required this.exerciseNames, required this.reps, required this.weight});

  void calculateTotalVolume() {
    for(int i = 0; i < reps.length; i++) {
      for(int j = 0; j < reps[i].length; j++) {
        totalVolume += weight[i][j] * reps[i][j] as int;
      }
    }
  }

  Plan.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    exerciseNames = json['exerciseNames'];
    reps = json['reps'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() => {
    "planName" : planName,
    "exerciseNames" : exerciseNames,
    "reps" : reps,
    "weight" : weight
  };
}