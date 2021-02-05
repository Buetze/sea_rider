import 'package:sea_rider/Entities/GameEntity.dart';
import 'package:sea_rider/models/Coord.dart';

class Player extends GameEntity{

  int hitPoints = 100;

  Player(Coord coord, double size) : super(coord, size);

  hit(int power){
    hitPoints -= power;
  }

}