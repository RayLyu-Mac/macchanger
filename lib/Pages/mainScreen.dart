import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'theme.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String map_display = "park";
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
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Where to go?",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "honey",
            color: Color.fromARGB(255, 101, 101, 101)),
      )),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    height: _screenH / 1.2,
                    width: _screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(map_display == "green"
                              ? "ast/img/greenspace.jpg"
                              : "ast/img/park.jpg"),
                          fit: BoxFit.cover),
                    )))
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: (() => {
                    setState(
                      () {
                        map_display = "green";
                      },
                    )
                  }),
              child: const Text("Green",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "honey",
                      color: Color.fromARGB(255, 87, 87, 87)))),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                          child: ThemeP()));
                });
              },
              icon: const Icon(
                Icons.find_in_page,
                color: Colors.white,
                size: 35,
              )),
          TextButton(
              onPressed: (() => {
                    setState(
                      () {
                        map_display = "park";
                      },
                    )
                  }),
              child: const Text("Park",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "honey",
                      color: Color.fromARGB(255, 87, 87, 87)))),
        ],
      ),
    );
  }
}
