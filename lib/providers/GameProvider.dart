import 'dart:async';

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

  get game => _game;

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

   this._game.gameLoop();

  }
}