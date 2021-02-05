import 'dart:math';
import 'package:sea_rider/Entities/GameEntity.dart';
import 'package:sea_rider/Entities/Collectable.dart';
import 'package:sea_rider/models/Coord.dart';
import 'package:sea_rider/Entities/Obstacle.dart';

import 'Game.dart';

class GameLogic{

  Game _game;

  GameLogic(this._game);

  List<Collectable> returnRandomCollectables(int amount){
    var rng = new Random();
    List<Collectable> _rtnList = new List<Collectable>();
    for (var i = 0; i < amount; i++){
      var size = (rng.nextInt(20) + 10).toDouble();
      var coord = new Coord(
          (rng.nextInt(_game.width.toInt()) + 10).toDouble(),
          (0 - rng.nextInt(300) +100).toDouble()
      );
      // sets the score, smaller brings more points
      var score = 1 / size * 10;
      _rtnList.add(new Collectable(coord, size, score));
    }
    return _rtnList;
  }

  List<Obstacle> returnRandomObstacles(int amount){
    var rng = new Random();
    List<Obstacle> _rtnList = new List<Obstacle>();
    for (var i = 0; i < amount; i++){
      var size = (rng.nextInt(25) + 5).toDouble();
      var coord = new Coord(
          (rng.nextInt(_game.width.toInt()) + 10).toDouble(),
          (0 - rng.nextInt(300) + 100).toDouble()
      );
      _rtnList.add(new Obstacle(coord, size));
    }
    return _rtnList;
  }

  bool collisionDetection(GameEntity e1, GameEntity e2){
    var x = e1.pos.x - e2.pos.x;
    var y = e1.pos.y - e2.pos.y;

    var distance = sqrt((x * x) + (y * y));
    return distance < e1.size + e2.size;
  }

  double newRandX(){
    var rng = new Random();
    return (rng.nextInt(_game.width.toInt()) + 10).toDouble();
  }

  double newRandY(){
    var rng = new Random();
    return (0 - (rng.nextInt(300) + 100)).toDouble();
  }

  double newRandSize(){
    var rng = new Random();
    return (rng.nextInt(25) + 5).toDouble();
  }
}