// lib/constants/breakpoints.dart
abstract class Breakpoints {
  static const double doublesmall = 650;
  static const double extraSmall = 700;
  static const double eextraSmall = 750;
  static const double smallPhone = 800;
  static const double xxsmall = 860;
  static const double largePhone = 900;
  static const double xxLarge = 990; // Pixel 6 Pro, iPhone 14 Pro Max
  static const double extraLarge = 900;
  static const double max = 1000;
}

abstract class BreakpointsForYou {
  static const double xs = 600;   // very small phones
  static const double sm = 650;   // small phones
  static const double md = 700;   // medium phones
  static const double lg = 750;   // large phones
  static const double xl = 800;   // phablets / small tablets
  static const double xxl = 850;  // tablets
  static const double xxxl = 900; // larger tablets
  static const double max = 950;  // upper range (fallback before desktop)
}
