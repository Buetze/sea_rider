
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_rider/providers/GameProvider.dart';
import 'package:sea_rider/ui/GamePainter.dart';
import 'package:sensors/sensors.dart';

class GameField extends StatefulWidget {
  @override
  _GameFieldState createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField>
  with TickerProviderStateMixin {

/*  AnimationController _controller;
  Animation<double> _animation;
  Tween<double> _tween = Tween(begin: 10, end: 100);*/

/*  double _ax = 0, _ay = 0, _az = 0;
  StreamSubscription<AccelerometerEvent> _accsub;*/

  @override
  void initState() {
    super.initState();

/*    UserInput(){
      _accsub = accelerometerEvents.listen( (AccelerometerEvent event) {
        setState(() {
          _ax = event.x;
          _ay = event.y;
          _az = event.z;
        });
      });*/

/*      _controller = AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 2000),
  );

    _animation = _tween.animate(_controller)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();*/


 /* startAnimation();
  }

  Future<void> startAnimation() async {
  await _controller.forward();*/

  }

  @override
  Widget build(BuildContext context) {
    var _gameProvider = Provider.of<GameProvider>(context);
    return Container(
        child: CustomPaint(
        size: Size(300, 300),
          painter: GamePainter(_gameProvider),
      )
    );
  }

}