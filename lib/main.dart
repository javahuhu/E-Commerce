import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'splashscreen.dart';
import 'package:go_router/go_router.dart';
import 'homescreen.dart';
import 'createaccount.dart';
void main() {
  runApp(const MyApp());
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
        return const CreateaccountScreen();
      },
    ),
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
    )


    );
    
  
  }
}





