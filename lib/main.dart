import 'package:e_commercehybrid/View/forgotpassword.dart';
import 'package:e_commercehybrid/View/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'splashscreen.dart';
import 'package:go_router/go_router.dart';
import 'View/homescreen.dart';
import 'View/createaccount.dart';
import 'View/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(
  initialLocation: '/', // Starts at SplashScreen
  routes: <RouteBase>[
    GoRoute(
      path: '/', // Splash Screen
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/homescreen',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/createaccount',
      builder: (BuildContext context, GoRouterState state) {
        return CreateaccountScreen();
      },
    ),

    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),

    GoRoute(
      path: '/forgotpassword',
      builder: (BuildContext context, GoRouterState state) {
        return ForgotpasswordScreen();
      },
    ),

    GoRoute(path: '/otp',
    builder: (BuildContext context, GoRouterState state){
      return const OtpScreen();
    })
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) => MaterialApp.router(
        title: 'E-Commerce',
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
