import 'dart:async';

import 'package:sea_rider/providers/GameProvider.dart';
import 'package:sensors/sensors.dart';

class UserInput{

  double ax = 0, ay = 0, az = 0;

  GameProvider _gameProvider;
  StreamSubscription<AccelerometerEvent> _accsub;

  UserInput() {
    // _gameProvider = gameProvider;

    _accsub = accelerometerEvents.listen((AccelerometerEvent event) {
      ax = event.x;
      ay = event.y;
      az = event.z;
    });
  }




}