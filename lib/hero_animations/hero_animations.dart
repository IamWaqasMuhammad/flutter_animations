import 'package:flutter/material.dart';
import 'package:flutter_animations/hero_animations/detail_screen.dart';
import 'package:flutter_animations/implicit_animations/implicit_animations.dart';
import 'package:flutter_animations/lottie_animations/lottie_animations.dart';

class HeroAnimations extends StatefulWidget {
  const HeroAnimations({super.key});

  @override
  State<HeroAnimations> createState() => _HeroAnimationsState();
}

class _HeroAnimationsState extends State<HeroAnimations> {
  void _openDetailPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900),
        reverseTransitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, animation, secondaryAnimation) => const DetailScreen(),

        // Custom transition curve
        transitionsBuilder: (_, animation, __, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutBack,
          );

          return FadeTransition(
            opacity: curved,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animations'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        elevation: 1,
      ),

      body: Column(
        children: [
          ListTile(
            onTap: _openDetailPage,
            leading: Hero(
              tag: 'iPhone',
              // Custom Hero animation (scale + fade)

              flightShuttleBuilder: (flightContext, animation, direction, from, to) {
                return ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(begin: 0.5, end: 1.0)
                        .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      'assets/images/iphone_pic.jpeg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },

              child: CircleAvatar(
                radius: 28,
                backgroundImage: const AssetImage('assets/images/iphone_pic.jpeg'),
              ),
            ),

            title: const Text(
              'iPhone 17 Pro Max',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            subtitle: const Text(
              'Tap to view details',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
