
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:sea_rider/models/Coord.dart';



class GamePainter extends CustomPainter{

  var _gameProvider;

  GamePainter(gameprovider){
    this._gameProvider = gameprovider;
  }

  @override
  void paint(Canvas canvas, Size size) {

    Coord playerPos = _gameProvider.game.playerPosition;
    Coord obstPos = _gameProvider.game.obstaclePosition;

    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(playerPos.x,playerPos.y), 10, paint1);
      canvas.drawCircle(Offset(obstPos.x,obstPos.y), 10, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}