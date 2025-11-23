import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class LottieAnimations extends StatefulWidget {
  const LottieAnimations({super.key});

  @override
  State<LottieAnimations> createState() => _LottieAnimationsState();
}

class _LottieAnimationsState extends State<LottieAnimations> {
  bool showDeliveryAnimation = false;
  bool showSuccessAnimation = false;

  void _onOrderNowPressed() {
    setState(() {
      showDeliveryAnimation = true;
      showSuccessAnimation = false;
    });

    // Show success after 0.8 seconds
    Timer(Duration(milliseconds: 5000), () {
      setState(() {
        showDeliveryAnimation = false;
        showSuccessAnimation = true;
      });

      // Hide success after 1.2 seconds
      Timer(Duration(milliseconds: 1500), () {
        setState(() {
          showSuccessAnimation = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animations'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Free iPhone Order Now!!',
                  style: TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage('assets/images/iphone_pic.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          child: Text(
                            'iPhone 17 Pro Max - Orange Color - 2TB for Free ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Text(
                            'Just Click below button\nPlace Order right now!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: _onOrderNowPressed,
                  splashColor: Colors.grey,
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Order Now!',
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Delivery Animation (full screen with transparent background)
          if (showDeliveryAnimation)
            Container(
              color: Colors.black.withOpacity(0.2), // optional semi-transparent overlay
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/animations/loading_car.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

          // Success Animation (centered)
          if (showSuccessAnimation)
            Container(
              color: Colors.black.withOpacity(0.2), // optional semi-transparent overlay
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/animations/success.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }
}
