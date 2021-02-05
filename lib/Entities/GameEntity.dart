import 'package:sea_rider/models/Coord.dart';

abstract class GameEntity{
  Coord _coord;
  double size;

  GameEntity(this._coord, this.size);

  Coord get pos => _coord;

}