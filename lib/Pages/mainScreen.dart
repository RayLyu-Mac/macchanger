import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'theme.dart';
import 'primaryIntro.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String map_display = "park";
  double _screenWidth = 0;
  double _screenH = 0;
  List posinfo = [
    [0, 0, 0.5, 0.5],
    [0, 0.5, 0, 0.5]
  ];
  List parkInfo = [
    [
      "ast/img/abfall.jpg",
      "Albion Falls",
      "At 62 ft., Albion Falls is considered to be one of the most beautiful waterfalls in the Hamilton community, whose classic ‘cascade’ waterway features picturesque observation points, leisurely hiking trails, and family-friendly picnic spots.",
      Icon(Icons.waterfall_chart),
      MaterialStateProperty.all(Colors.lightBlueAccent),
      "https://nature.mcmaster.ca/area/albion-falls/",
    ],
    [
      "ast/img/bfpk.jpg",
      "Bayfront Park",
      "Found along the banks of Lake Ontario, Bayfront Park is a 40-acre park in the West-end of Hamilton Harbour. Connected to the beautiful Hamilton Waterfront Trail, specifically the Desjardins Trail, the park is a great place to start or end a waterfront stroll. ",
      Icon(Icons.padding),
      MaterialStateProperty.all(Colors.blue),
      "https://nature.mcmaster.ca/area/bayfront-park/",
      ["Lake", "Bus", "Bike", "Boating", "Biking"]
    ],
    [
      "ast/img/trail.jpg",
      "Chedoke Radial Trail",
      "The Chedoke Radial Trail is a 2.7-kilometre section of the Bruce Trail that traverses the Niagara Escarpment.",
      Icon(Icons.directions_walk),
      MaterialStateProperty.all(Colors.greenAccent),
      "https://nature.mcmaster.ca/area/chedoke-radial-trail/",
      ["Trail", "Forest", "Bike", "Bus", "Hiking", "Biking"]
    ],
    [
      "ast/img/cfbch.jpg",
      "Confederation Beach Park",
      "Confederation Beach Park is a 93-hectare park owned by the City of Hamilton and managed by the Hamilton Conservation Authority.",
      Icon(Icons.beach_access),
      MaterialStateProperty.all(Colors.lightBlue),
      "https://nature.mcmaster.ca/area/confederation-park/",
      ["Lake", "Car", "Boating", "Biking"]
    ],
    [
      "ast/img/djt.jpg",
      "Desjardins Trail",
      "Open all year round, the Desjardins Canal is a great area for runners, bikers, walkers, rollerbladers, skateboarders and hikers alike!",
      Icon(Icons.light),
      MaterialStateProperty.all(Colors.orange),
      "https://nature.mcmaster.ca/area/desjardins-trail/",
      ["Trail", "Bike", "Car", "Hiking", "Biking"]
    ],
    [
      "ast/img/dpfall.jpg",
      "Devils Punchbowl",
      "Consisting of colourful layers of stratified rock, Devil’s Punchbowl is widely considered to be one of the Escarpment’s most unforgettable sights.",
      Icon(Icons.waterfall_chart_rounded),
      MaterialStateProperty.all(Colors.lightBlue),
      "https://nature.mcmaster.ca/area/devils-punchbowl/",
      ["Fall", "Car", "Hiking"]
    ]
  ];
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
                    ))),
            for (var i = 0; i < posinfo[0].length; i++)
              Positioned(
                  top: posinfo[0][i] * _screenH,
                  left: posinfo[1][i] * _screenWidth,
                  child: Container(
                      height: _screenH / 2,
                      width: _screenWidth / 2,
                      child: primIntro(
                          contents: parkInfo[i][2],
                          title: parkInfo[i][1],
                          themeC: parkInfo[i][4],
                          url: parkInfo[i][5],
                          img: parkInfo[i][0],
                          butIcon: parkInfo[i][3])))
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
