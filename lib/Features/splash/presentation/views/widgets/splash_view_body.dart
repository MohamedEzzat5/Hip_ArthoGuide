
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:physical_therapy_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:physical_therapy_app/core/utils/app_router.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  // function to navigate to home in init state
  Future<void> navigateToHome() async {

    if (FirebaseAuth.instance.currentUser == null) {
      Future.delayed(const Duration(seconds: 3), () {
        GoRouter.of(context).push(AppRouter.kLoginView);
      });
    }else{
      Future.delayed(const Duration(seconds: 3), () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      });
    }
  }

// in init function => sliding animation.
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, -10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
