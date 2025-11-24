import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
        backgroundColor: Colors.lightGreenAccent,
        elevation: 1,
        title: const Text("iPhone Details"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: 'iPhone',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/iphone_pic.jpeg',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "iPhone 17 Pro Max",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Price: \$1499",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Description:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Experience unmatched performance with the A19 Bionic chip, "
                    "a stunning 6.9-inch ProMotion display, titanium edges, "
                    "and an ultra-advanced triple-camera setup that captures more "
                    "detail than ever before. The iPhone 17 Pro Max delivers the "
                    "future of mobile technology in your hands.",
                style: TextStyle(fontSize: 15, height: 1.4),
              ),
              SizedBox(
                height: 20,
              ),
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
      ),
    );
  }
}
