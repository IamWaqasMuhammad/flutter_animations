import 'package:flutter/material.dart';
import 'package:flutter_animations/explicit_animations/explicit_animations.dart';
import 'package:flutter_animations/implicit_animations/implicit_animations.dart';

import 'lottie_animations/lottie_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ImplicitAnimations(),
    );
  }
}

