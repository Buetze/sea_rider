
import 'package:flutter/material.dart';
import 'package:sea_rider/models/Coord.dart';
import 'package:sea_rider/models/Obstacle.dart';

import 'Player.dart';
import 'UserInput.dart';


class Game with ChangeNotifier{

  bool isPaused = false;
  bool _run = true;
  int velocity = 10;

  Player _player;
  Obstacle _obstacle;

  UserInput _userInput;

  Coord get playerPosition => _player.position;
  Coord get obstaclePosition => _obstacle.position;


  Game(){
    _player = new Player(new Coord(150,230));
    _obstacle = new Obstacle(new Coord(140, 0));
    _userInput = new UserInput();
  }

  tab(){
    togglePause();
  }

  togglePause(){
    isPaused = !isPaused;
  }

  gameLoop(){
    _obstacle.position.y += 1 * velocity;

    _player.position.x -= _userInput.ax;
    velocity += (_userInput.az / 2).round();
  }

  _garbageCollector(){}

  _collisionDetection(){}


}