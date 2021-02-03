import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_rider/providers/GameProvider.dart';
import 'package:sea_rider/widgets/GameField.dart';

class PlayScreen extends StatefulWidget {
  static const ROUTE_NAME = '/play';

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    var _gameProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      appBar: AppBar( ),
      body: Center(
        child: GestureDetector(
          onTap: () => { _gameProvider.tab() },
          child: SizedBox(
            width: 300,
            height: 300,
            child: GameField()
          ),
        ),
      ),
    );
  }
}
