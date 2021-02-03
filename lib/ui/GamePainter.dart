
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sea_rider/logic/Player.dart';
import 'dart:ui' as ui;

import 'package:sea_rider/models/Coord.dart';
import 'package:sea_rider/models/Obstacle.dart';



class GamePainter extends CustomPainter{

  var _gameProvider;

  GamePainter(gameprovider){
    this._gameProvider = gameprovider;
  }

  @override
  void paint(Canvas canvas, Size size) {

    Player player = _gameProvider.game.player;
    Obstacle obstacle = _gameProvider.game.obstacle;
    List<Obstacle> obstacles = _gameProvider.game.obstacles;

    Coord playerPos = player.pos;
    double playerSize = player.size;



    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(playerPos.x,playerPos.y), playerSize, paint1);

      obstacles.forEach((element) {
        Coord obstPos = element.pos;
        double obstSize = element.size;

        canvas.drawCircle(Offset(obstPos.x,obstPos.y), obstSize, paint1);
      });


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}