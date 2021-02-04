import 'package:sea_rider/interfaces/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Collectable extends GameEntity{
  int score;
  bool remove = false;

  Collectable(Coord coord, double size, int score) : super(coord, size);

}