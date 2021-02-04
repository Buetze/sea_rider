
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sea_rider/logic/Player.dart';
import 'package:sea_rider/models/Collectable.dart';
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
    List<Collectable> collectables = _gameProvider.game.collectables;

    Coord playerPos = player.pos;
    double playerSize = player.size;

    var width = _gameProvider.game.width;
    var height = _gameProvider.game.height;

    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..style = PaintingStyle.fill;

    var collectable = Paint()
      ..color = Color(0xff35ff63)
      ..style = PaintingStyle.fill;

    //Prints Player
      canvas.drawCircle(Offset(playerPos.x,playerPos.y), playerSize, paint1);

    //prints obstacles
      obstacles.forEach((element) {
        Coord obstPos = element.pos;
        double obstSize = element.size;

        canvas.drawCircle(Offset(obstPos.x,obstPos.y), obstSize, paint1);
      });

    collectables.forEach((element) {
      Coord pos = element.pos;
      double size = element.size;

      canvas.drawCircle(Offset(pos.x,pos.y), size, collectable);
    });

    // Prints Paused Text
    if(_gameProvider.game.isPaused){
      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 30,
      );
      final textSpan = TextSpan(
        text: 'Game Paused',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final offset = Offset(width / 2, height / 2);
      textPainter.paint(canvas, offset);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}