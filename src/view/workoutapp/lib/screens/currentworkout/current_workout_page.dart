import 'package:flutter/material.dart';
import 'package:view/screens/currentworkout/workout_plan.dart';

class CurrentWorkout extends StatefulWidget {
  const CurrentWorkout({Key? key}) : super(key: key);

  @override
  _CurrentWorkoutState createState() => _CurrentWorkoutState();
}

class _CurrentWorkoutState extends State<CurrentWorkout> {
  bool isActiveWorkout = false;
  List<Widget> page = [];

  @override
  Widget build(BuildContext context) {
    // if (isActiveWorkout == false) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Workout", style: TextStyle(fontSize: 25)),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('Start Workout'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WorkoutPlan()));
                },
              ),
            ),
          ),
          Center(child: Text('No Active Workout'))
        ],
      ),
    );
    // }
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Current Workout"),
    //     ),
    //     body: WorkoutPlan());
  }
}
