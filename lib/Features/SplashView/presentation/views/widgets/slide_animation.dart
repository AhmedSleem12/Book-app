import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {
  const SlideAnimation({
    Key? key,
    required this.animationOffset,
  }) : super(key: key);

  final Animation<Offset> animationOffset;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationOffset,
      builder: (context, _) {
        return SlideTransition(
          position: animationOffset,
          child: const Text(
            "Read Books For Free",
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
