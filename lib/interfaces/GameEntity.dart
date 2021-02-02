import 'package:flutter/cupertino.dart';
import 'package:sea_rider/models/Coord.dart';

abstract class GameEntity{
  Coord _coord;
  int _velocity;

  Coord get Position => _coord;
  int get Velocity => _velocity;

  Draw(_ctx) {}

}