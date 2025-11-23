import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DeliveryCar extends StatelessWidget {
  const DeliveryCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset('assets/animations/loading_car.json'),
        ]
      )
    );
  }
}
