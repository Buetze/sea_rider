import 'package:sea_rider/models/Coord.dart';

abstract class GameEntity{
  Coord _coord;

  GameEntity(this._coord);

  Coord get position => _coord;

}