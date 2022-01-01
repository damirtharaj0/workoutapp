import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:view/models/plan_class.dart';
import 'package:view/screens/plans/single_plan.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart' as service;

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Plans"),
      ),
      body: FutureBuilder(
          initialData: [],
          future: getJsonData(),
          builder: (context, jsonData) {
            List plans = [];
            plans = jsonData.data as List;
            return ListView.builder(
              itemCount: plans.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SinglePlan(plans[index]),
                );
              },
            );
          }),
    );
  }

  Future<List> getJsonData() async {
    // final jsonData = await service.rootBundle.loadString('assets/plans.json');
    // final list = json.decode(jsonData) as List;

    var jsonData = await get(Uri.parse("http://127.0.0.1:5000/plans"));
    final list = json.decode(jsonData.body);
    return list.map((e) => Plan.fromJson(e)).toList();
  }
}



// final jsonData = await service.rootBundle.loadString('assets/plans.json');
//     final list = json.decode(jsonData) as List;

    // var response = await get(Uri.parse("http://127.0.0.1:5000/plans"));
    // final jsonObject = json.decode(response.body);
    // // print(jsonObject["plans"].runtimeType);
    // return jsonObject["plans"];
    // return list;