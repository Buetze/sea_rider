import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sea_rider/logic/Game.dart';

class GameProvider with ChangeNotifier{

  Game _game;

  Timer _timer;

  GameProvider(){
  _timer = _createTimer();
  _game = new Game();
}

  initPreferences() {

  }

  tab(){
    _game.tab();
    notifyListeners();
  }

  get x => _game.x;
  get y => _game.y;



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

    this._game.x += 5;
    if(this._game.x > 300){
      this._game.x = 0;
    }

  }
}