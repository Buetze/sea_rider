
import 'package:flutter/material.dart';
import 'package:sea_rider/models/Coord.dart';
import 'package:sea_rider/models/Obstacle.dart';

import 'dart:math';

import 'Player.dart';
import 'UserInput.dart';


class Game with ChangeNotifier{

  bool isPaused = false;
  bool _run = true;
  int velocity = 10;

  Player _player;
  Obstacle _obstacle;
  List<Obstacle> _obstacles;

  UserInput _userInput;

  Coord get playerPosition => _player.pos;
  Coord get obstaclePosition => _obstacle.pos;

  Player get player => _player;
  Obstacle get obstacle => _obstacle;
  List<Obstacle> get obstacles => _obstacles;



  Game(){
    _player = new Player(new Coord(150,230), 30);
    _obstacle = new Obstacle(new Coord(140, 0), 40);
    _userInput = new UserInput();
    _obstacles = new List<Obstacle>();
    _obstacles.add(_obstacle);
  }

  tab(){
    togglePause();
  }

  togglePause(){
    isPaused = !isPaused;
  }

  gameLoop(){

    if(isPaused){ return; }

    // Obstacles next position
    _obstacles.forEach((element) {
      element.pos.y += 1 * velocity;
      if(element.pos.y > 400){
        element.pos.y = 0;
      }
    });


    //Userinput and Velocity
    _player.pos.x -= _userInput.ax;
    if(velocity < 10){
      velocity += (_userInput.az / 2).round();
    }

    _collisionDetection();

  }

  _garbageCollector(){}

  _collisionDetection(){

    _obstacles.forEach((b) {
      var a = _player;

      var x = a.pos.x - b.pos.x;
      var y = a.pos.y - b.pos.y;

      var distance = sqrt((x * x) + (y * y));

      if(distance < a.size + b.size){
        // b.remove = true;
        a.hit(b.power);
        a.pos.x += 10;
        if(a.hitPoints < 0){
          // a.remove = true;
          // this.score += a.score;
        }
      };
    });
  }


}