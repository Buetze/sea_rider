
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_rider/providers/GameProvider.dart';
import 'package:sea_rider/ui/GamePainter.dart';
import 'package:sensors/sensors.dart';

class GameField extends StatefulWidget {
  @override
  _GameFieldState createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField>
  with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var _gameProvider = Provider.of<GameProvider>(context);
    return Container(
        child: CustomPaint(
        size: Size(300, 300),
          painter: GamePainter(_gameProvider),
      )
    );
  }

}