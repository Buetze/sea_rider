import 'package:flutter/material.dart';

class Game{

  bool isPaused = false;
  bool _run = true;
  CustomPainter _drawContext;
  double x = 50;
  double y = 50;

  tab(){
    _gameLoop();
  }

  _gameLoop(){

    int i = 0;

    while (i < 10){
      this.x += 20;
    }

  }

  _garbageCollector(){}

  _collisionDetection(){}

}