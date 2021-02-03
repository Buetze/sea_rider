import 'dart:ui';

import 'package:sea_rider/interfaces/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Player extends GameEntity{
  Offset offset;

  Offset force;

  bool active;

  Player(Coord coord) : super(coord);

}