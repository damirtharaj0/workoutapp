class Plan {
  late String planName;
  late List exerciseNames;
  late List reps;
  late List weight;
  int totalVolume = 0;
  List exerciseVolumes = [];

  Plan({required this.planName, required this.exerciseNames, required this.reps, required this.weight});

  void calculateExerciseVolumes() {
    for(int i = 0; i < reps.length; i++) {
      for(int j = 0; j < reps[i].length; j++) {
        exerciseVolumes.add(weight[i][j] * reps[i][j]);
      }
    }
  }

  void calculateTotalVolume() {
    calculateExerciseVolumes();
    for(int i = 0; i < exerciseVolumes.length; i++) {
      totalVolume += exerciseVolumes[i] as int;
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