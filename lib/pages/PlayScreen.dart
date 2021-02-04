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
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    _gameProvider.setDisplaySize(width, height);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sea Raider'),
        actions: actions(context),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => { _gameProvider.startOrResumeGame() },
          child: SizedBox(
            width: width,
            height: height,
            child: _gameProvider.game.run ? GameField() : Text ('Tab to start')
          ),
        ),
      ),
    );
  }
}

List<Widget> actions(BuildContext context) {
  var _gameProvider = Provider.of<GameProvider>(context);
  return [
    IconButton(
        icon: Icon(Icons.edit_rounded),
        onPressed: () {
          _gameProvider.startOrResumeGame();
        }
    ),
  ];
}
