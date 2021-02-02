import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_rider/providers/GameProvider.dart';
import 'package:sea_rider/ui/GamePainter.dart';

class PlayScreen extends StatelessWidget {
  static const ROUTE_NAME = '/play';



  @override
  Widget build(BuildContext context) {
    var _gameProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      appBar: AppBar( ),
      body: Center(
        child: GestureDetector(
          onTap: () => {log('message')},
          child: SizedBox(
            width: 300,
            height: 300,
            child: CustomPaint(
              size: Size(300, 300),
              painter: GamePainter(context),
            ),
          ),
        ),
      ),
    );
  }
}
