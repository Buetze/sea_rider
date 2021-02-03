import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sea_rider/models/Coord.dart';

import 'Player.dart';

class Game with ChangeNotifier{

  bool isPaused = false;
  bool _run = true;
  Player player;
  int velocity = 10;

  double x = 50;
  double y = 50;

  Game(){
    player = new Player(new Coord(50,50));
  }

  tab(){
    togglePause();
  }

  togglePause(){
    isPaused = !isPaused;
  }


  _gameLoop(){

  }

  _garbageCollector(){}

  _collisionDetection(){}


}