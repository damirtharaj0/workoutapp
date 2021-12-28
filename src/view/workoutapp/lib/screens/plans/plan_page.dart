import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:view/models/plan_class.dart';
import 'package:view/screens/plans/single_plan.dart';
import 'package:flutter/services.dart' as service;

class PlansPage extends StatefulWidget {
  const PlansPage({ Key? key }) : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {


  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      future: getJsonData(),
      builder: (context, jsonData) {
        List plans = [];
        plans = jsonData.data as List;
        if(jsonData.hasData) {
          return ListView.builder(
            itemCount: plans.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SinglePlan(plans[index]),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List> getJsonData() async {
    final jsonData = await service.rootBundle.loadString('assets/plans.json');
    final list = json.decode(jsonData) as List;
    return list.map((e) => Plan.fromJson(e)).toList();
  }
}