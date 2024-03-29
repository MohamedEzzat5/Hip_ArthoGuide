import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'Features/auth/presentation/manger/register_cubit/register_cubit.dart';
import 'core/utils/app_router.dart';
import 'injection_container.dart' as di;
import 'bloc_observer.dart';
import 'core/utils/constances.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void userState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('=================user is currently signed out');
      } else {
        debugPrint('=================user is signed in');
      }
    });
  }

  @override
  void initState() {
    userState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<RegisterCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<LoginCubit>(),
        ),
      ],
      child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: false).copyWith(
            scaffoldBackgroundColor: Colors.white,
            textTheme:
            GoogleFonts.tajawalTextTheme(ThemeData.light().textTheme),
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          )),
    );
  }
}





