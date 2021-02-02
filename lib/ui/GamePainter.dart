import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'package:sea_rider/providers/GameProvider.dart';


class GamePainter extends CustomPainter with ChangeNotifier{

  var _ctx;
  var _gameProvider;

/*  double x = this._gameProvider.x;
  double y = this._gameProvider.y;*/

  GamePainter(context){
    this._ctx = context;
    this._gameProvider = Provider.of<GameProvider>(context);
    /*_gameProvider.setCanvasCtx(this);*/
  }

/*  double x = 50, y = 50;

  Timer _timer;

  @override
  void dispose() {
    this._cancelTimers();
    super.dispose();
  }

  _cancelTimers(){
    this._timer.cancel();
  }

  Timer _createTimer(){
    return Timer.periodic (Duration(milliseconds: 300), (Timer t) {
      setThisState();
      notifyListeners();
    });
  }

  setThisState(){
    this.x += 5;
    this.y += 5;
  }*/

  @override
  void paint(Canvas canvas, Size size) {

    final pointMode = ui.PointMode.points;
    var points = [
      Offset(50,50),

    ];
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}