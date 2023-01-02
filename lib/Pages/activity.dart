import 'package:flutter/material.dart';
import 'package:macchanger/mc.dart';
import 'theme.dart';
import 'calendar.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List activities = [
    [
      "Hiking",
      MaterialStateProperty.all(Colors.greenAccent.shade200),
      'ast/lot/walk.json'
    ],
    [
      "Biking",
      MaterialStateProperty.all(Colors.green.shade400),
      'ast/lot/bike2.json'
    ],
    [
      "Boating",
      MaterialStateProperty.all(Colors.lightBlueAccent),
      'ast/lot/boat.json'
    ],
    [
      "Dog Walking",
      MaterialStateProperty.all(Colors.orange.shade100),
      'ast/lot/dog.json'
    ],
    [
      "Other",
      MaterialStateProperty.all(Colors.purple.shade300),
      'ast/lot/football.json'
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return MCMode(
      material: activities,
      title: "Activities",
      pageTo: TableBasicsExample(),
    );
  }
}
