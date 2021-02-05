import 'package:sea_rider/interfaces/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Obstacle extends GameEntity {
  int score;
  bool remove = false;

  get power => size ~/ 3; // divisor that returns double

  Obstacle(Coord coord, double size) : super(coord, size);

}