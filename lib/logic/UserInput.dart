import 'dart:async';

import 'package:sensors/sensors.dart';

class UserInput{

  double ax = 0, ay = 0, az = 0;

  StreamSubscription<AccelerometerEvent> _accsub;

  UserInput() {

    _accsub = accelerometerEvents.listen((AccelerometerEvent event) {
      ax = event.x;
      ay = event.y;
      az = event.z;
    });
  }

  void dispose() {
    _accsub.cancel();
  }




}