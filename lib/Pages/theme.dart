import 'package:flutter/material.dart';
import 'package:macchanger/buttonDesign.dart';
import 'package:macchanger/blank.dart';

//https://www.theguardian.com/environment/2019/jun/08/forest-bathing-japanese-practice-in-west-wellbeing forest
//https://www.sandiegouniontribune.com/communities/east-county/story/2020-11-02/lakeside-getting-some-long-needed-upgrades lake side
//https://www.frommers.com/slideshows/848417-10-spectacular-and-stirring-waterfall-hikes-in-the-usa waterfall
class ThemeP extends StatefulWidget {
  const ThemeP({super.key});

  @override
  State<ThemeP> createState() => _ThemePState();
}

class _ThemePState extends State<ThemeP> {
  double _screenWidth = 0;
  double _screenH = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenWidth = MediaQuery.of(context).size.width;
    _screenH = MediaQuery.of(context).size.height;
  }

  List viewimg = [
    [
      "ast/img/forest.png",
      "Forest",
      "Experience the fresh brought by the forst",
      Icon(Icons.forest),
      Colors.green.shade200
    ],
    [
      "ast/img/lake.png",
      "Lake",
      "placeHolder",
      Icon(Icons.water),
      Colors.lightBlueAccent
    ],
    [
      "ast/img/fall.jpg",
      "Fall",
      "placeHolder",
      Icon(Icons.waterfall_chart),
      Colors.blue
    ],
    [
      "ast/img/trail.jpg",
      "Trail",
      "placeHolder",
      Icon(Icons.hiking),
      Color.fromARGB(255, 255, 244, 144)
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: _screenWidth / 20,
          mainAxisSpacing: _screenH / 40,
          children: [
            for (var i = 0; i < viewimg.length; i++)
              box_file(
                img: viewimg[i][0],
                title: viewimg[i][1],
                labelName: viewimg[i][1],
                width: _screenWidth / 4,
                height: _screenH / 3,
                content: viewimg[i][2],
                buttonIcon: viewimg[i][3],
                but_col: viewimg[i][4],
                pageto: Blank(),
              )
          ],
        ),
      ),
    );
  }
}
