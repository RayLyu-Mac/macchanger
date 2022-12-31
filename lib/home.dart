import 'package:flutter/material.dart';
import 'backpic.dart';
import 'buttonDesign.dart';
import 'Pages/theme.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//https://www.designlinesmagazine.com/six-projects-green-space-unexpected-locations/ pic ref
class _HomePageState extends State<HomePage> {
  double _screenWidth = 0;
  double _screenH = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return backGroundPic(
        transp: 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _screenH / 5,
            ),
            Container(
              height: _screenH / 5,
              width: _screenWidth / 1.5,
              child: Lottie.asset("ast/lot/welco.json", fit: BoxFit.fitWidth),
            ),
            SizedBox(
              height: _screenH / 3,
            ),
            NormalButton(
              buttonName: "Sign In With Google",
              pageTo: ThemeP(),
              width: _screenWidth / 1.5,
              height: _screenH / 10,
            ),
            SizedBox(
              height: _screenH / 25,
            ),
            DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Text(
                "Join Now",
              ),
            )
          ],
        ),
        pic: "ast/img/green.jpg");
  }
}
