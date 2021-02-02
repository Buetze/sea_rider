import 'package:sea_rider/models/Coord.dart';

abstract class GameEntity{
  Coord _coord;
  int _velocity;

  Coord get position => _coord;
  int get velocity => _velocity;

  Draw(_ctx) {}

}