import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sea_rider/logic/Game.dart';

class GameProvider with ChangeNotifier{

  Game _game;
  Timer _timer;

  GameProvider(){
    _game = new Game();
  }

  initPreferences() {  }

  tab(){
    _game.togglePause();
    notifyListeners();
  }

  startOrResumeGame(){
    // check if game runs and toggle pause if so
    _game.run? _game.togglePause() :
    // else start the game
    _game.init();
    if (_timer == null){
      _timer = _createTimer();
    }
    _game.run = true;
    notifyListeners();
  }

  get game => _game;

  setDisplaySize(width, height){
    _game.width = width;
    _game.height = height;
  }

  // Timer
  @override
  void dispose() {
    this._cancelTimers();
    super.dispose();
  }

  _cancelTimers(){
    this._timer.cancel();
  }

  Timer _createTimer(){
    return Timer.periodic (Duration(milliseconds: 50), (Timer t) {
      setThisState();
      notifyListeners();
    });
  }

  setThisState(){

   _game.gameLoop();
  }
}