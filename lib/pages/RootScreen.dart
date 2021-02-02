import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_rider/pages/MainScreen.dart';
import 'package:sea_rider/providers/GameProvider.dart';

import 'PlayScreen.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Provider.of<GameProvider>(context).initPreferences(),
      builder: (context, future) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          MainScreen.ROUTE_NAME: (context) => PlayScreen(),
        },
      ),
    );
  }
}