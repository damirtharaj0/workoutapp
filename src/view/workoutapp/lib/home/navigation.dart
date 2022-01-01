import 'package:flutter/material.dart';

import '../screens/currentworkout/current_workout_page.dart';
import '../screens/plans/plan_page.dart';
import '../screens/profile/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({ Key? key }) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  
  int _selectedIndex = 0;
  List labels = [
    'Plans',
    'Current Workout',
    'Profile'
  ];
  List<Widget> _widgetOptions = <Widget>[
    PlansPage(),
    CurrentWorkout(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          labels[_selectedIndex],
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold 
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan),
            label: 'Plans'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Current Workout'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Plans'
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}