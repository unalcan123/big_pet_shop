import 'package:flutter/material.dart';

class Begen extends StatefulWidget {
  const Begen({Key? key}) : super(key: key);

  @override
  _BegenState createState() => _BegenState();
}

class _BegenState extends State<Begen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _renkAnimasyon;
  late Animation _boyutAni;
  bool favori = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _renkAnimasyon = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);
    // _controller.forward();
    _controller.addListener(() {
      // print(_controller?.value);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
        favori = true;
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          favori = false;
        });
      }
    });
    _boyutAni = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 30.0, end: 40.0)
              .chain(CurveTween(curve: Curves.bounceIn)),
          weight: 40.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 40.0, end: 30.0)
              .chain(CurveTween(curve: Curves.bounceIn)),
          weight: 40.0,
        ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return IconButton(
              onPressed: () {
                favori ? _controller.reverse() : _controller.forward();
              },
              icon: Icon(
                Icons.favorite,
                color: _renkAnimasyon.value,
                size: _boyutAni.value,
              ));
        });
  }
}
