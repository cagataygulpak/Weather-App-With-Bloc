import 'package:flutter/material.dart';

class ChangeBackgroundColor extends StatelessWidget {
  const ChangeBackgroundColor(
      {super.key, required this.color, required this.child});

  final MaterialColor color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color[200]!, color[500]!, color[800]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops:const  [0.2 , 0.5 ,0.8]),
      ),
      child: child,
    );
  }
}
