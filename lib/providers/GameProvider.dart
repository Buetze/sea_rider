import 'package:flutter/material.dart';
import 'package:sea_rider/logic/Game.dart';

class GameProvider with ChangeNotifier{

  var _canvasCtx;
  var _game;

  double _x = 50;
  double _y = 50;

  initPreferences() {
  }

  setCanvasCtx(ctx){
    this._canvasCtx = ctx;
  }

  get game => _game;
  get x => x;
  get y => y;

}