import 'package:e_commercehybrid/View/Payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../splashscreen.dart';
import '../View/FrontPage/homescreen.dart';
import '../View/SignUp/createaccount.dart';
import '../View/LogIn/login.dart';
import '../View/ForgotPassword/forgotpassword.dart';
import '../View/ForgotPassword/otp.dart';
import '../View/ForgotPassword/changepassword.dart';
import '../View/CarouselIntro/carouselslider.dart';
import '../View/HomePage.dart/start.dart';
import '../View/Profile/profile.dart';
import '../View/Recentviewed/recentlyviewed.dart';
import '../View/addtocart/addtocart.dart';
import '../View/chooseproduct/chooseproduct.dart';
import '../View/wishlist/wishlist.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/homescreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/createaccount',
      builder: (context, state) => CreateaccountScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(
      path: '/forgotpassword',
      builder: (context, state) => ForgotpasswordScreen(),
    ),
    GoRoute(path: '/otp', builder: (context, state) => const OtpScreen()),
    GoRoute(
      path: '/changepassword',
      builder: (context, state) => ChangepasswordScreen(),
    ),
    GoRoute(path: '/carousel', builder: (context, state) => CarouselScreen()),
    GoRoute(path: '/startscreen', builder: (context, state) => StartScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
    GoRoute(path: '/wishlist', builder: (context, state) => WishlistScreen()),
    GoRoute(
      path: '/recentviewed',
      builder: (context, state) => RecentviewScreen(),
    ),
    GoRoute(path: '/cart', builder: (context, state) => CartScreen()),

    GoRoute(
      path: '/chooseproduct',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: Chooseitem(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    ),

    GoRoute(path: '/payment', builder: (context, state) => PaymentScreen(),)
  ],
);
