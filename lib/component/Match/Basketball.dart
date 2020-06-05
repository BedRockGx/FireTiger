import 'package:flutter/material.dart';

class BasketBall extends StatefulWidget {
  @override
  _BasketBallState createState() => _BasketBallState();
}

class _BasketBallState extends State<BasketBall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('篮球'),
      ),
    );
  }
}