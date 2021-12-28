import 'package:flutter/material.dart';
import 'home/navigation.dart';

void main() {
  runApp(WorkoutApp());
}

class WorkoutApp extends StatefulWidget {
  const WorkoutApp({ Key? key }) : super(key: key);

  @override
  _WorkoutAppState createState() => _WorkoutAppState();
}

class _WorkoutAppState extends State<WorkoutApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigation(),
      title: 'Flutter Theme',
    );
  }
}