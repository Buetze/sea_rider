import 'package:sea_rider/interfaces/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Obstacle extends GameEntity {
  int score;
  // int power = 2;
  bool remove = false;

  get power => (size / 3).toInt();

  Obstacle(Coord coord, double size) : super(coord, size);

}