import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_rider/providers/GameProvider.dart';
import 'package:sea_rider/ui/GamePainter.dart';

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
          painter: GamePainter(_gameProvider),
      )
    );
  }

}