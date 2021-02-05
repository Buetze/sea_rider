import 'package:flutter/material.dart';
import 'package:sea_rider/logic/GameLogic.dart';
import 'package:sea_rider/Entities/Collectable.dart';
import 'package:sea_rider/models/Coord.dart';
import 'package:sea_rider/Entities/Obstacle.dart';

import 'package:flutter/services.dart';

import '../Entities/Player.dart';
import 'UserInput.dart';


class Game with ChangeNotifier{

  GameLogic _gameLogic;
  bool isPaused = false;
  bool gameOver = false;
  bool run = false;
  double velocity = 10;
  double _score = 0;
  double _stagedScore = 0;
  int _stage = 1;
  int _stageUpdateScore = 10;
  int _maxObstacles = 5;
  int _maxCollectables = 3;
  int _maxVelocity = 20;
  double width = 0;
  double height = 0;

  Player _player;
  Obstacle _obstacle;
  List<Obstacle> _obstacles;
  List<Collectable> _collectables;

  UserInput _userInput;

  Coord get playerPosition => _player.pos;
  Coord get obstaclePosition => _obstacle.pos;

  Player get player => _player;
  int get playerHp => _player.hitPoints;
  Obstacle get obstacle => _obstacle;
  List<Obstacle> get obstacles => _obstacles;
  List<Collectable> get collectables => _collectables;
  get speed => (velocity / 10).toStringAsFixed(2);
  get scoreAsTxt => _score.toStringAsFixed(2);
  int get stage => _stage;


  get score => _score;

  Game(){
    _gameLogic = new GameLogic(this);
    _userInput = new UserInput();
    _obstacles = new List<Obstacle>();
    _collectables = new List<Collectable>();
  }

  togglePause(){
    isPaused = !isPaused;
  }

  init(){
    _player = new Player(new Coord(width/ 2,height - height* 0.2 ), 30);
    _obstacles = _gameLogic.returnRandomObstacles(_maxObstacles);
    _collectables = _gameLogic.returnRandomCollectables(_maxCollectables);
    _maxObstacles = 5;
  }

  gameLoop(){

    // stop tick if game is paused
    if(isPaused || gameOver){ return; }

    // Gamestatus update
    _update();

    // Move all Game entities
    _moveObj();

    // Move player
    _handleUserInput();

    // Collision detection
    _collisionDetection();

    // Removes unussed elements
    _garbageCollector();

    // repopulates the gamefield
    _populate();

  }

  _garbageCollector(){
    //removes unused entities
    _obstacles.removeWhere( (element) => element.remove);
    _collectables.removeWhere( (element) => element.remove);
  }

  setScore (double score) => {
    _score += score,
    _stagedScore += score
  };

  _update(){
    _setStage();
  }

  _setStage(){
    if (_stagedScore / _stageUpdateScore > 1){
      _stage += 1;
      _maxObstacles += 1;
      _stagedScore -= _stageUpdateScore;
    }
  }

  _collisionDetection(){

    // Obstacles
    _obstacles.forEach((element) {
      if(_gameLogic.collisionDetection(player, element)){
        element.remove = true;
        HapticFeedback.mediumImpact();
        _player.hit(element.power);
        if(_player.hitPoints <= 0){
          gameOver = true;
        }
      };
    });

    // Collectable
    _collectables.forEach((element) {
      if(_gameLogic.collisionDetection(_player, element)){
        element.remove = true;
        HapticFeedback.lightImpact();
        setScore(element.score * velocity / 10);
      };
    });
  }

  _populate(){

    //  Number of obstacles left on the field
    var oNum = _maxObstacles -_obstacles.length;
    if ( oNum >= 0){ _obstacles.addAll(_gameLogic.returnRandomObstacles(oNum)); }

    //  Number of collectable left on the field
    var cNum = _maxCollectables -_collectables.length;
    if ( cNum >= 0){ _collectables.addAll(_gameLogic.returnRandomCollectables(cNum)); }
  }

  _handleUserInput(){
    var x =  _player.pos.x;
    var size = _player.size;
    var ax = _userInput.ax;
    var ay = _userInput.ay;

    //Apply Userinput and Velocity
    if((x - size > 0 || ax < 0) &&
        (x + size < width || ax > 0)){
      _player.pos.x -= ax*2;
    }

    if((velocity <= _maxVelocity || ay > 0) &&
        (velocity >= 10 || ay <0)){
      velocity -= (_userInput.ay / 10);
    }
  }

  _moveObj(){
    // Obstacles next position
    _obstacles.forEach((element) {
      element.pos.y += 1 * velocity;
      if(element.pos.y > height){
        element.pos.y =  _gameLogic.newRandY();
        element.pos.x = _gameLogic.newRandX();
        element.size = _gameLogic.newRandSize();
      }
    });

    // Collectable next position
    _collectables.forEach((element) {
      element.pos.y += 1 * velocity;
      if(element.pos.y > height){
        element.pos.y = _gameLogic.newRandY();
        element.pos.x = _gameLogic.newRandX();
      }
    });
  }

}