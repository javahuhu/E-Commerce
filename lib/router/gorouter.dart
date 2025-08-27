import 'package:e_commercehybrid/View/HomePage.dart/opensearch.dart';
import 'package:e_commercehybrid/View/Payment/payment.dart';
import 'package:e_commercehybrid/View/ToRecieved/recieved.dart';
import 'package:e_commercehybrid/View/chatbot/chatbot.dart';
import 'package:e_commercehybrid/View/flashsale/flashsale.dart';
import 'package:e_commercehybrid/View/myactivity/activity.dart';
import 'package:e_commercehybrid/View/orderhistory/orderhistory.dart';
import 'package:e_commercehybrid/View/trackOrder/tractorder.dart';
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
    GoRoute(
      path: '/startscreen',
      builder: (context, state) => StartScreen(),
      routes: [],
    ),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
    GoRoute(path: '/wishlist', builder: (context, state) => WishlistScreen()),
    GoRoute(
      path: '/recentviewed',
      builder: (context, state) => RecentviewScreen(),
    ),
    GoRoute(path: '/cart', builder: (context, state) => CartScreen()),

    GoRoute(
      path: '/chooseproduct',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
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
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
      routes: [],
    ),

    GoRoute(path: '/payment', builder: (context, state) => PaymentScreen()),

    GoRoute(
      path: '/torecieved',
      builder: (context, state) => ToRecievedScreen(),
    ),
    GoRoute(path: '/trackorder', builder: (context, state) => TrackOrder()),
    GoRoute(path: '/myactivity', builder: (context, state) => MyActivity()),
    GoRoute(path: '/orderhistory', builder: (context, state) => OrderHistory()),
    GoRoute(path: '/flashsale', builder: (context, state) => FlashSale()),

    GoRoute(
      path: '/opensearch',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: Opensearch(),
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
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    ),
    GoRoute(path: '/chatbot', builder: (context, state) => ChatBot()),
  ],
);
