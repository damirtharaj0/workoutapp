import 'package:flutter/material.dart';
import 'package:view/login/welcome_page.dart';

import '../screens/currentworkout/current_workout_page.dart';
import '../screens/plans/plan_page.dart';
import '../screens/profile/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  List screens = [
    PlansPage(),
    CurrentWorkout(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: WelocomePage(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.next_plan), label: 'Plans'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run), label: 'Current Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
