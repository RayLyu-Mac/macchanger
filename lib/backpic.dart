import 'package:flutter/material.dart';

class backGroundPic extends StatefulWidget {
  backGroundPic(
      {@required this.child,
      @required this.pic,
      @optionalTypeArgs this.transp,
      Key? key})
      : super(key: key);
  final Widget? child;
  final String? pic;
  final double? transp;

  @override
  _backGroundPicState createState() => _backGroundPicState();
}

class _backGroundPicState extends State<backGroundPic> {
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
    return Container(
        width: _screenWidth,
        height: _screenH * 1.1,
        decoration: BoxDecoration(
            color: Colors.grey.shade500,
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(widget.transp ?? 0.8),
                    BlendMode.dstATop),
                image: AssetImage(widget.pic!),
                fit: BoxFit.cover)),
        child: widget.child);
  }
}
