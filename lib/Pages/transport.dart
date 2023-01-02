import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:macchanger/blank.dart';
import 'package:page_transition/page_transition.dart';
import 'package:macchanger/mc.dart';
import 'activity.dart';

class TransTools extends StatefulWidget {
  const TransTools({super.key});

  @override
  State<TransTools> createState() => _TransToolsState();
}

class _TransToolsState extends State<TransTools> {
  double _screenWidth = 0;
  double _screenH = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  List transBut = [
    [
      "Bus",
      MaterialStateProperty.all(Colors.orange.shade100),
      "ast/lot/bus.json",
    ],
    [
      "Bike",
      MaterialStateProperty.all(Colors.greenAccent.shade200),
      "ast/lot/bike.json"
    ],
    [
      "Walk",
      MaterialStateProperty.all(Colors.green.shade400),
      "ast/lot/walk.json"
    ],
    ["Car", MaterialStateProperty.all(Colors.red.shade300), "ast/lot/car.json"]
  ];
  @override
  Widget build(BuildContext context) {
    return MCMode(
      material: transBut,
      title: "Transportation Tool",
      pageTo: Activity(),
    );
  }
}
