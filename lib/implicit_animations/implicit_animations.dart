import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

double height = 200;
double width = 200;
double opacity = 1;

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animations'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                height = height == 300 ? 200 : 300;
                width = width == 300 ? 200 : 300;
              });
            },
            child: Text(height != 300 ? 'Increase Size' : 'Decrease Size'),
          ),
          SizedBox(height: 20),
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: opacity,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                opacity = opacity == 1 ? 0 : 1;
              });
            },
            child: Text(opacity != 1 ? 'Increase Opacity' : 'Decrease Opacity'),
          ),
        ],
      ),
    );
  }
}
