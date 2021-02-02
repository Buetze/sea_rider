import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sea_rider/pages/MainScreen.dart';
import 'package:sea_rider/providers/GameProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameProvider()),
      ],
      child: MainScreen(),
    );
  }
}