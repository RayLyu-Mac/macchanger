import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class primIntro extends StatefulWidget {
  final List contents;
  final String img;
  final String url;
  final Colors themeC;
  const primIntro(
      {required this.contents,
      required this.themeC,
      required this.url,
      required this.img,
      super.key});

  @override
  State<primIntro> createState() => _primIntroState();
}

class _primIntroState extends State<primIntro> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionDuration: Duration(milliseconds: 300),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) {
              return Container();
            },
            transitionBuilder: (context, a1, a2, widgets) {
              return Transform.scale(
                  scale: a1.value,
                  child: Opacity(
                      opacity: a1.value,
                      child: SimpleDialog(
                        shape: Border.all(
                          width: 4,
                          style: BorderStyle.solid,
                          color: Colors.white,
                        ),
                        title: widget.contents[0],
                        children: [
                          Image(image: AssetImage(widget.img)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(widget.contents[1]),
                          ElevatedButton(
                              onPressed: (() {
                                _launchURL(widget.url);
                              }),
                              child: const Text("More Info"))
                        ],
                      )));
            });
      },
    );
  }

  _launchURL(url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
