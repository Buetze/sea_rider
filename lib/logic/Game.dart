
import 'package:flutter/material.dart';
import 'package:sea_rider/logic/GameLogic.dart';
import 'package:sea_rider/models/Collectable.dart';
import 'package:sea_rider/models/Coord.dart';
import 'package:sea_rider/models/Obstacle.dart';

import 'package:flutter/services.dart';

import 'dart:math';

import 'Player.dart';
import 'UserInput.dart';


class Game with ChangeNotifier{

  GameLogic _gameLogic;
  bool isPaused = false;
  bool run = false;
  int velocity = 10;
  int score = 0;
  int _maxObstacles = 5;
  int _maxCollectables = 3;
  double width = 0;
  double height = 0;

  Player _player;
  Obstacle _obstacle;
  List<Obstacle> _obstacles;
  List<Collectable> _collectables;

  UserInput _userInput;

  Coord get playerPosition => _player.pos;
  Coord get obstaclePosition => _obstacle.pos;

  Player get player => _player;
  Obstacle get obstacle => _obstacle;
  List<Obstacle> get obstacles => _obstacles;
  List<Collectable> get collectables => _collectables;


  Game(){

    _gameLogic = new GameLogic();


    _userInput = new UserInput();
    _obstacles = new List<Obstacle>();
    _collectables = new List<Collectable>();


  }

  togglePause(){
    isPaused = !isPaused;
  }

  init(){
    _player = new Player(new Coord(width / 2,height -100), 30);

    _obstacles = _gameLogic.returnRandomObstacles(_maxObstacles);
    _collectables = _gameLogic.returnRandomCollectables(_maxCollectables);
  }

  gameLoop(){

    // stop tick if game is paused
    if(isPaused){ return; }

    // Obstacles next position
    _obstacles.forEach((element) {
      element.pos.y += 1 * velocity;
      if(element.pos.y > 400){
        element.pos.y = -400;
      }
    });

    // Collectable next position
    _collectables.forEach((element) {
      element.pos.y += 1 * velocity;
      if(element.pos.y > 400){
        element.pos.y = -400;
      }
    });

    //Apply Userinput and Velocity
    if(_player.pos.x > 0 && _player.pos.x < 400){
      _player.pos.x -= _userInput.ax;
    }
    if(velocity < 10){
      velocity += (_userInput.az / 2).round();
    }


    // Collision detection
    _collisionDetection();

    // Removes unussed elements
    _garbageCollector();

    // repopulates the gamefield
    _populate();

  }

  _garbageCollector(){

    //removes unused enteties
    _obstacles.removeWhere( (element) => element.remove);
    _collectables.removeWhere( (element) => element.remove);
  }

  _collisionDetection(){

    // Obstacles
    _obstacles.forEach((element) {
      if(_gameLogic.collisionDetection(player, element)){
        element.remove = true;
        HapticFeedback.lightImpact();

      };
    });

    // Collectable
    _collectables.forEach((element) {
      if(_gameLogic.collisionDetection(_player, element)){
        element.remove = true;
        HapticFeedback.lightImpact();

      };
    });
  }

  _populate(){

    //  Number of obstacles left on the field
    var oNum = _maxObstacles -_obstacles.length;
    if ( oNum >= 0){ _obstacles.addAll(_gameLogic.returnRandomObstacles(oNum)); }

    //  Number of collectable left on the field
    var cNum = _maxCollectables -_collectables.length;
    if ( cNum >= 0){ _collectables.addAll(_gameLogic.returnRandomCollectables(cNum)); }
  }

}