import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Hero(
              tag: 'iPhone',
              child: Container(
                height: 300,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iphone_pic.jpeg'),
                    fit: BoxFit.cover,
                  ),

                ),
              ),
            ),
          ],
        ),
    );
  }
}
