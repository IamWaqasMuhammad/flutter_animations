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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroAnimations'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        elevation: 1,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LottieAnimations()));
            },
            leading: Hero(
              tag: 'iPhone',
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/iphone_pic.jpeg'),
              ),
            ),
            title: Text('iPhone 17 Pro Max'),
          ),
        ],
      ),
    );
  }
}