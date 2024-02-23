import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/utils/media_query_values.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) => SlideTransition(
        position: slidingAnimation,
        child:  Image.asset('assets/images/Logo.png',height: context.height*.125),
      ),
    );
  }
}
