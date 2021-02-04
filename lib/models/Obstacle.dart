import 'package:sea_rider/interfaces/Collisionable.dart';
import 'package:sea_rider/interfaces/Destroyable.dart';
import 'package:sea_rider/interfaces/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Obstacle extends GameEntity implements Destroyable{
  @override

  int score;
  int power = 2;

  Obstacle(Coord coord, double size) : super(coord, size);
  

  @override
  int destroy() {
    // TODO: implement destroy
    throw UnimplementedError();
  }

}