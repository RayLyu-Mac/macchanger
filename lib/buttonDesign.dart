import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Button1 extends StatefulWidget {
  final Widget? pageTo;
  final double? width;
  final double? height;
  final String? buttonName;
  final double? fontsize;
  const Button1(
      {@required this.pageTo,
      @required this.width,
      @required this.height,
      @required this.buttonName,
      @optionalTypeArgs this.fontsize,
      super.key});

  @override
  State<Button1> createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.expand(width: widget.width, height: widget.height),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height! / 2),
          border: Border.all(color: Colors.grey.shade300, width: 5)),
      child: TextButton(
        child: Text(widget.buttonName!),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 500),
                  child: widget.pageTo!,
                  type: PageTransitionType.rightToLeft));
        },
      ),
    );
  }
}

class PicButton extends StatefulWidget {
  final Widget? pageTo;
  final double? width;
  final double? height;
  final String? img;
  final double? transp;
  final String? buttonName;

  const PicButton(
      {@required this.pageTo,
      @required this.width,
      @required this.height,
      @required this.img,
      @required this.buttonName,
      @optionalTypeArgs this.transp,
      super.key});

  @override
  State<PicButton> createState() => _PicButtonState();
}

class _PicButtonState extends State<PicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(widget.transp ?? 0.8),
                      BlendMode.dstATop),
                  image: AssetImage(widget.img!),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(widget.height! / 6),
              border: Border.all(color: Colors.grey.shade300, width: 5)),
          child: Text(widget.buttonName!)),
    );
  }
}

class NormalButton extends StatefulWidget {
  final Widget? pageTo;
  final double? width;
  final double? height;
  final String? buttonName;
  final double? fontsize;
  const NormalButton(
      {@required this.pageTo,
      @required this.width,
      @required this.height,
      @required this.buttonName,
      @optionalTypeArgs this.fontsize,
      super.key});

  @override
  State<NormalButton> createState() => _NormalButtonState();
}

class _NormalButtonState extends State<NormalButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.expand(width: widget.width, height: widget.height),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 145, 48),
          borderRadius: BorderRadius.circular(widget.height! / 4.5),
          border: Border.all(color: Colors.grey.shade300, width: 4)),
      child: TextButton(
        child: Text(
          widget.buttonName!,
          style: TextStyle(
              color: Colors.grey.shade50,
              fontWeight: FontWeight.bold,
              fontSize: widget.fontsize ?? widget.height! / 3),
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 500),
                  child: widget.pageTo!,
                  type: PageTransitionType.rightToLeft));
        },
      ),
    );
  }
}
