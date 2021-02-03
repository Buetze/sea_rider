import 'dart:ui';

import 'package:sea_rider/interfaces/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Player extends GameEntity{

  int hitPoints = 3;

  Player(Coord coord, double size) : super(coord, size);

  hit(int power){
    this.hitPoints - power;
  }

}