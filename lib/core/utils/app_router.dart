import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:physical_therapy_app/Features/auth/presentation/view/login_screen.dart';
import 'package:physical_therapy_app/Features/auth/presentation/view/register_screen.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/exercise_body1.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/exercise_body2.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/exercise_body3.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/widgets/exercise_body4.dart';
import 'package:physical_therapy_app/Features/home/presentaion/screens/home_screen.dart';
import 'package:physical_therapy_app/Features/profile/presentation/views/profile_view.dart';
import 'package:physical_therapy_app/Features/splash/presentation/views/splash_view.dart';
import 'package:physical_therapy_app/views/abstract_screen.dart';
import 'package:physical_therapy_app/Features/exercise/presentation/screens/exercise_screen.dart';
import 'package:physical_therapy_app/Features/warning/presentation/screens/warning_screen.dart';


abstract class AppRouter {
  static const kHomeView = '/homeScreen';
  static const kLoginView = '/loginScreen';
  static const kRegisterView = '/registerScreen';
  static const kExerciseView = '/exerciseScreen';
  static const kExerciseBody1 = '/exerciseBody1';
  static const kExerciseBody2 = '/exerciseBody2';
  static const kExerciseBody3 = '/exerciseBody3';
  static const kExerciseBody4 = '/exerciseBody4';
  static const kWarningView = '/warningScreen';
  static const kAbstractView = '/abstractScreen';
  static const kProfileView = '/profileView';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: kLoginView,
        builder: (BuildContext context, GoRouterState state) {
          return  LoginPage();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: kExerciseView,
        builder: (BuildContext context, GoRouterState state) {
          return  const ExercisePage();
        },
      ),
      GoRoute(
        path: kAbstractView,
        builder: (BuildContext context, GoRouterState state) {
          return  const AbstractScreen();
        },
      ),
      GoRoute(
        path: kWarningView,
        builder: (BuildContext context, GoRouterState state) {
          return  const WarningSreen();
        },
      ),GoRoute(
        path: kProfileView,
        builder: (BuildContext context, GoRouterState state) {
          return  const ProfileView();
        },
      ),GoRoute(
        path: kExerciseBody1,
        builder: (BuildContext context, GoRouterState state) {
          return  const ExerciseBody1();
        },
      ),GoRoute(
        path: kExerciseBody2,
        builder: (BuildContext context, GoRouterState state) {
          return  const ExerciseBody2();
        },
      ),GoRoute(
        path: kExerciseBody3,
        builder: (BuildContext context, GoRouterState state) {
          return  const ExerciseBody3();
        },
      ),GoRoute(
        path: kExerciseBody4,
        builder: (BuildContext context, GoRouterState state) {
          return  const ExerciseBody4();
        },
      ),

    ],
  );
}
