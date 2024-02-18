import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';
import 'package:physical_therapy_app/core/utils/style.dart';

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
        child:  Text(
          'مرحبًا بك نتمني لك الشفاء العاجل',style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600,color: darkBlueGray ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
