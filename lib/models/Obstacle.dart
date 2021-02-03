import 'package:sea_rider/interfaces/Collisionable.dart';
import 'package:sea_rider/interfaces/Destroyable.dart';
import 'package:sea_rider/interfaces/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Obstacle extends GameEntity implements Collisionable, Destroyable{
  @override

  int score;

  Obstacle(Coord coord) : super(coord);

  @override
  void checkCollision() {
    // TODO: implement checkCollision
  }

  @override
  int destroy() {
    // TODO: implement destroy
    throw UnimplementedError();
  }

}