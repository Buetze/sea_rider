import 'package:sea_rider/interfaces/Collisionable.dart';
import 'package:sea_rider/interfaces/Destroyable.dart';
import 'package:sea_rider/interfaces/GameEntity.dart';

class Obstacle extends GameEntity implements Collisionable, Destroyable{
  @override
  int score;

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