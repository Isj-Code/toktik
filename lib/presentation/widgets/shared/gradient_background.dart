import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Color? gColor1;
  final Color? gColor2;
  const GradientBackground({
    super.key,
    color1,
    color2,
  })  : gColor1 = color1 ?? Colors.transparent,
        gColor2 = color2 ?? Colors.black;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.7,
              1,
            ],
            colors: [
              gColor1!,
              gColor2!,
            ],
          ),
        ),
      ),
    );
  }
}
