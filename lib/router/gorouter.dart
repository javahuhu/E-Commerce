import 'package:e_commercehybrid/View/HomePage.dart/opensearch.dart';
import 'package:e_commercehybrid/View/Payment/payment.dart';
import 'package:e_commercehybrid/View/ToRecieved/recieved.dart';
import 'package:e_commercehybrid/View/Voucher/voucher.dart';
import 'package:e_commercehybrid/View/chatbot/chatbot.dart';
import 'package:e_commercehybrid/View/flashsale/flashsale.dart';
import 'package:e_commercehybrid/View/myactivity/activity.dart';
import 'package:e_commercehybrid/View/orderhistory/orderhistory.dart';
import 'package:e_commercehybrid/View/settings/paymentmethods.dart';
import 'package:e_commercehybrid/View/settings/profilesettings.dart';
import 'package:e_commercehybrid/View/settings/settings.dart';
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
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/homescreen',
      builder: (context, state) => const HomeScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/createaccount',
      builder: (context, state) => CreateaccountScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/forgotpassword',
      builder: (context, state) => ForgotpasswordScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OtpScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/changepassword',
      builder: (context, state) => ChangepasswordScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/carousel',
      builder: (context, state) => CarouselScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/startscreen',
      builder: (context, state) => StartScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/wishlist',
      builder: (context, state) => WishlistScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/recentviewed',
      builder: (context, state) => RecentviewScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => CartScreen(),
      routes: [],
    ),
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
    GoRoute(
      path: '/payment',
      builder: (context, state) => PaymentScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/torecieved',
      builder: (context, state) => ToRecievedScreen(),
      routes: [],
    ),
    GoRoute(
      path: '/trackorder',
      builder: (context, state) => TrackOrder(),
      routes: [],
    ),
    GoRoute(
      path: '/myactivity',
      builder: (context, state) => MyActivity(),
      routes: [],
    ),
    GoRoute(
      path: '/orderhistory',
      builder: (context, state) => OrderHistory(),
      routes: [],
    ),
    GoRoute(
      path: '/flashsale',
      builder: (context, state) => FlashSale(),
      routes: [],
    ),
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
      routes: [],
    ),
    GoRoute(
      path: '/chatbot',
      builder: (context, state) => ChatBot(),
      routes: [],
    ),
    GoRoute(
      path: '/voucher',
      builder: (context, state) => VoucherScreen(),
      routes: [],
    ),

    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(),
      routes: [],
    ),

    GoRoute(
      path: '/profilesettings',
      builder: (context, state) => ProfileSettings(),
      routes: [],
    ),

     GoRoute(
      path: '/paymentmethods',
      builder: (context, state) => PaymentMethodScreen(),
      routes: [],
    ),
  ],
);
