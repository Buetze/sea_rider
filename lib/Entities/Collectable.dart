import 'package:sea_rider/models/Coord.dart';

import 'GameEntity.dart';

class Collectable extends GameEntity{
  double score;
  bool remove = false;

  Collectable(Coord coord, double size, double score) : super(coord, size){
    this.score = score;
  }

}