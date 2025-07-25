import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commercehybrid/constantsize.dart';
import 'package:glassmorphism/glassmorphism.dart'; // Add this import for the pi constant
import 'dart:math' as math;
import 'package:dotted_line/dotted_line.dart';

class PaymentScreen extends ConsumerWidget {
  @override
  PaymentScreen({super.key});

  final selectIndex = StateProvider<int>((ref) => -1);

  final List<Map<String, dynamic>> navicons = [
    {
      "iconActive": 'assets/homeactive.png',
      "iconsdefault": 'assets/homeicon.png',
      "type": 'home',
    },
    {
      "iconActive": 'assets/bookactive.png',
      "iconsdefault": 'assets/bookicon.png',
      "type": 'list',
    },
    {
      "iconActive": 'assets/heartactive.png',
      "iconsdefault": 'assets/hearticon.png',
      "type": 'wishlist',
    },
    {
      "iconActive": 'assets/shoppingactive.png',
      "iconsdefault": 'assets/shoppingicon.png',
      "type": 'cart',
    },
    {
      "iconActive": '',
      "iconsdefault": 'assets/testprofile.jpg',
      "type": 'profile',
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectnavIndex = StateProvider<int>((ref) => 3);
    final extraLarge = MediaQuery.of(context).size.height > 900;
    final selected = ref.watch(selectedPayment);
    final carousel = ref.watch(carouselpayment);
    final selectedcard = selected != -1 ? carousel[selected] : null;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 25.h),
                      child: Text(
                        'Payment',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: extraLarge ? 120.h : 100.h,
                    width: extraLarge ? 400.w : 350.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            top: extraLarge ? 20.h : 15.h,
                          ),
                          child: Text(
                            'Shipping Address',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: extraLarge ? 20.sp : 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 15.h),
                              child: SizedBox(
                                width: 260.w,
                                child: Text(
                                  '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: extraLarge ? 15.sp : 12.sp,
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              height: 35.w,
                              width: 35.w,
                              margin: EdgeInsets.only(
                                right: 6.w,
                                top: _responsiveedit(context),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF9775FA),
                                shape: BoxShape.circle,
                              ),

                              child: IconButton(
                                onPressed: () {
                                  _showAddressBottomModal(context);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  size: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: extraLarge ? 120.h : 100.h,
                    width: extraLarge ? 400.w : 350.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 0.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            top: extraLarge ? 20.h : 15.h,
                          ),
                          child: Text(
                            'Contact Information',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: extraLarge ? 20.sp : 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 15.w,
                                    top: 15.h,
                                  ),
                                  child: SizedBox(
                                    width: 260.w,
                                    child: Text(
                                      '+84932000000',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: extraLarge ? 15.sp : 12.sp,
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 15.w,
                                    top: 0.h,
                                  ),
                                  child: SizedBox(
                                    width: 260.w,
                                    child: Text(
                                      'amandamorgan@example.com',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: extraLarge ? 15.sp : 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              height: 35.w,
                              width: 35.w,
                              margin: EdgeInsets.only(
                                right: 6.w,
                                top: _responsiveedit(context),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF9775FA),
                                shape: BoxShape.circle,
                              ),

                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  size: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Items',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 22.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(width: 10.w),

                            Container(
                              height: extraLarge ? 50.w : 40.w,
                              width: extraLarge ? 50.w : 40.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF9775FA),
                                shape: BoxShape.circle,
                              ),

                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: extraLarge ? 25.sp : 22.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15.h),

                        SizedBox(
                          height: extraLarge ? 50.h : 45.h,
                          child: ElevatedButton(
                            onPressed: () {
                              _showVoucherModal(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              backgroundColor: Colors.transparent,
                              foregroundColor: Color(0xFF9775FA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              side: BorderSide(
                                color: Color(0xFF9775FA),
                                width: 2.w,
                              ),
                            ),
                            child: Text(
                              'Add Voucher',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: extraLarge ? 15.sp : 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 55.w,
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4.w,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5,
                                      ),
                                    ],

                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/testprofile.jpg',
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  left: 40.w,
                                  child: Container(
                                    height: 30.w,
                                    width: 30.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFE5EBFC),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3.w,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),

                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 30.w),

                            SizedBox(
                              width: extraLarge ? 200.w : 185.w,
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur.',
                                style: TextStyle(
                                  fontSize: extraLarge ? 15.sp : 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Text(
                          '\$17.00',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 55.w,
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4.w,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5,
                                      ),
                                    ],

                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/testprofile.jpg',
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  left: 40.w,
                                  child: Container(
                                    height: 30.w,
                                    width: 30.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFE5EBFC),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3.w,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),

                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 30.w),

                            SizedBox(
                              width: extraLarge ? 200.w : 185.w,
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur.',
                                style: TextStyle(
                                  fontSize: extraLarge ? 15.sp : 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Text(
                          '\$17.00',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w, top: 20.h),
                      child: Text(
                        'Shipping Options',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ref.read(selectIndex.notifier).state =
                            ref.read(selectIndex.notifier).state == 0 ? -1 : 0;
                      },
                      child: Container(
                        height: 55.h,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: Color(0xFFE5EBFC),
                          borderRadius: BorderRadius.circular(10.r),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Container(
                                    height: 27.w,
                                    width: 27.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 5.w,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 3.25.h,
                                  left: 13.w,
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 200),
                                    transitionBuilder: (child, animation) =>
                                        ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        ),
                                    child: Container(
                                      key: ValueKey(
                                        ref.watch(selectIndex) == 0,
                                      ),
                                      height: 21.w,
                                      width: 21.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ref.watch(selectIndex) == 0
                                            ? Color(0xFF9775FA)
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                      ),

                                      child: ref.watch(selectIndex) == 0
                                          ? Icon(
                                              Icons.check,
                                              size: 15.sp,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 6.w),

                            Text(
                              'Standard',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),

                            SizedBox(width: 35.w),

                            Container(
                              height: 25.h,
                              width: 75.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF9775FA),
                                borderRadius: BorderRadius.circular(3.r),
                              ),

                              child: Text(
                                '5 - 7 Days',
                                style: TextStyle(
                                  fontFamily: 'RalewayRegular',
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            SizedBox(width: 65.w),

                            Text(
                              'FREE',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: GestureDetector(
                      onTap: () {
                        ref.read(selectIndex.notifier).state =
                            ref.read(selectIndex.notifier).state == 1 ? -1 : 1;
                      },
                      child: Container(
                        height: 55.h,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: Color(0xFFE5EBFC),
                          borderRadius: BorderRadius.circular(10.r),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Container(
                                    height: 27.w,
                                    width: 27.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 5.w,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 3.25.h,
                                  left: 13.w,
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 200),
                                    transitionBuilder: (child, animation) =>
                                        ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        ),
                                    child: Container(
                                      key: ValueKey(
                                        ref.watch(selectIndex) == 1,
                                      ),
                                      height: 21.w,
                                      width: 21.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ref.watch(selectIndex) == 1
                                            ? Color(0xFF9775FA)
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                      ),

                                      child: ref.watch(selectIndex) == 1
                                          ? Icon(
                                              Icons.check,
                                              size: 15.sp,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 6.w),

                            Text(
                              'Express',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),

                            SizedBox(width: 45.w),

                            Container(
                              height: 25.h,
                              width: 75.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF9775FA),
                                borderRadius: BorderRadius.circular(3.r),
                              ),

                              child: Text(
                                '5 - 7 Days',
                                style: TextStyle(
                                  fontFamily: 'RalewayRegular',
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            SizedBox(width: 65.w),

                            Text(
                              'FREE',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 18.w, top: 5.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Delivered on or before Thursday, 23 April 2020',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 13.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        Container(
                          height: 35.w,
                          width: 35.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF9775FA),
                          ),

                          child: IconButton(
                            onPressed: () {
                              _showPaymentBottoModal(context, ref);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 0.h),
                    child: Row(
                      children: [
                        if (selectedcard != null) ...[
                          SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: Image.asset(selectedcard['Paymentimg']),
                          ),

                          SizedBox(width: 10.w),

                          Text(
                            selectedcard['name'],
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                        ] else
                          Text(
                            'No payment method selected',
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 200.h),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 85.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Container(
                    height: extraLarge ? 60.h : 55.h,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 245, 245),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total \$34,00',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.sp,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: Color(0xFF202020),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Pay',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Container(
                    height: _responsivesize(context),
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(horizontal: 24.w),

                    decoration: BoxDecoration(
                      color: Color(0xFF9775FA),
                      borderRadius: BorderRadius.circular(100.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9775FA).withValues(alpha: 0.3),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: navicons.asMap().entries.map((entry) {
                        int index = entry.key;
                        var item = entry.value;

                        return GestureDetector(
                          onTap: () {
                            ref.read(selectnavIndex.notifier).state = index;

                            switch (index) {
                              case 0:
                                context.go('/startscreen');
                              case 1:
                                context.go('/');
                              case 2:
                                context.go('/wishlist');
                              case 3:
                                context.go('/cart');
                              case 4:
                                context.go('/profile');
                            }
                          },

                          child: item['type'] == 'profile'
                              ? Container(
                                  height: 35.w,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(
                                      color:
                                          ref
                                                  .read(selectnavIndex.notifier)
                                                  .state ==
                                              index
                                          ? Colors.white
                                          : Color(0xFF9775FA),
                                      width: 2.5.w,
                                    ),
                                  ),

                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      100.r,
                                    ),
                                    child: Image.asset(
                                      item['iconsdefault'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: _responsiveNavIconsheight(context),
                                  width: _responsiveNavIconswidth(context),
                                  child: Image.asset(
                                    ref.read(selectnavIndex.notifier).state ==
                                            index
                                        ? item['iconActive']
                                        : item['iconsdefault'],
                                  ),
                                ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddressBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
    ),
    builder: (context) {
      return Container(
        height: 505.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Shipping Address',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 22.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 10.h),
              child: Text(
                'Address',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF8FAFF),
                    hintText:
                        'Magadi Main Rd, next to Prasanna Theatre, Cholourpalya, Bengaluru, Karnataka 560023',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 10.h),
              child: Text(
                'Town / City',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF8FAFF),
                    hintText: 'Bengaluru, Karnataka 560023',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 10.h),
              child: Text(
                'Post Code',
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF8FAFF),
                    hintText: '8080808',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: 1,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      backgroundColor: Color(0xFF9775FA),
                    ),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

final selectedPayment = StateProvider<int>((ref) => -1);
final carouselpayment = Provider<List<Map<String, dynamic>>>(
  (ref) => [
    {
      "Paymentimg": 'assets/gcash.png',
      "gradient": LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF0074CC), // GCash Blue
          Color(0xFF33B3FF),
        ],
      ),
      "title": "assets/gcashtxt.png",
      "name": 'Gcash',
      "height": 50.h,
      "width": 100.w,
    },
    {
      "Paymentimg": 'assets/mastercard.png',
      "gradient": LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFF79E1B), Color(0xFFFF5F00)],
      ),
      "title": "assets/mastercardtxt.png",
      "name": 'Mastercard',
      "height": 50.h,
      "width": 100.w,
    },
    {
      "Paymentimg": 'assets/paypal.png',
      "gradient": LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF003087), Color(0xFF009CDE)],
      ),
      "title": "assets/paypaltxt.png",
      "name": 'PayPal',
      "height": 50.h,
      "width": 100.w,
    },
    {
      "Paymentimg": 'assets/paymaya.png',
      "gradient": LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color.fromARGB(255, 10, 214, 85), Color(0xFF4CD964)],
      ),
      "title": "assets/paymayatxt.png",
      "name": 'PayMaya',
      "height": 50.h,
      "width": 100.w,
    },

    {
      "Paymentimg": 'assets/cod.png',
      "gradient": LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF4CAF50), // mid green
          Color(0xFF2E7D32),
        ], // darker green],
      ),
      "title": "assets/cashdelivery.png",
      "height": 50.h,
      "width": 100.w,
      "name": 'Cash On Delivery',
    },
  ],
);

void _showPaymentBottoModal(BuildContext context, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          return Container(
            height: 370.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 90.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),

                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontFamily: 'Raleway',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50.h),
                CarouselSlider.builder(
                  itemCount: ref.watch(carouselpayment).length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                        final card = ref.watch(carouselpayment)[index];
                        return GestureDetector(
                          onTap: () {
                            ref.read(selectedPayment.notifier).state =
                                ref.read(selectedPayment.notifier).state ==
                                    index
                                ? -1
                                : index;
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  gradient: card['gradient']!,
                                ),

                                child: GlassmorphicContainer(
                                  width: 350.w,
                                  height: 180.h,
                                  borderRadius: 20,
                                  blur: 5,
                                  alignment: Alignment.bottomCenter,
                                  border: 3,
                                  linearGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      ref.watch(selectedPayment) == index
                                          ? Colors.black.withValues(alpha: 0.05)
                                          : Color(
                                              0xFFffffff,
                                            ).withValues(alpha: 0.1),
                                      ref.watch(selectedPayment) == index
                                          ? Colors.black.withValues(alpha: 0.05)
                                          : Color(
                                              0xFFFFFFFF,
                                            ).withValues(alpha: 0.05),
                                    ],
                                    stops: [0.1, 1],
                                  ),
                                  borderGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFffffff).withValues(alpha: 0.5),
                                      Color(
                                        (0xFFFFFFFF),
                                      ).withValues(alpha: 0.5),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 10.w,
                                          top: 10.h,
                                        ),
                                        child: SizedBox(
                                          height: 55.h,
                                          width: 55.w,
                                          child: Image.asset(
                                            card['Paymentimg']!,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: SizedBox(
                                            height: card['height'],
                                            width: card['width'],
                                            child: Image.asset(card['title']),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 267.5.w,
                                top: 7.h,
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 200),
                                  transitionBuilder: (child, animation) =>
                                      ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      ),
                                  child: ref.watch(selectedPayment) == index
                                      ? Container(
                                          height: 25.w,
                                          width: 25.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),

                                          child: Icon(
                                            Icons.check,
                                            size: 15.sp,
                                            color: Colors.white,
                                          ),
                                        )
                                      : SizedBox(key: ValueKey('empty')),
                                ),
                              ),
                            ],
                          ),
                        );
                      },

                  options: CarouselOptions(
                    height: 190.h,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void _showVoucherModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    builder: (context) {
      return Container(
        height: 350.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),

        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      SizedBox(height: 115.h),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size(356.w, 100.h),
                            painter: ClippedBorderPainter(
                              clipRadius: 10.0,
                              borderColor: Colors
                                  .blueAccent, // Color for the rounded clip borders
                              borderWidth: 3.w,
                            ),
                          ),
                          ClippedVoucher(
                            width: 356.w,
                            height: 130.h,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.blueAccent,
                                  width: 2.w,
                                ),
                              ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Voucher',
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 18.sp,
                                            color: Colors.blueAccent,
                                          ),
                                        ),

                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                            vertical: 5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFF9F9F),
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                          ),

                                          child: Text(
                                            'Valid Until 5.16.20',
                                            style: TextStyle(
                                              fontFamily: 'RalewayRegular',
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 0.3.w),
                                    child: DottedLine(
                                      direction: Axis.horizontal,
                                      lineLength: double.infinity,
                                      lineThickness: 2.0,
                                      dashLength: 4.0,
                                      dashColor: Colors.blueAccent,
                                      dashGapLength: 4.0,
                                      dashGapColor: Colors.transparent,
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 20.h,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.shop_2,
                                          size: 22.sp,
                                          color: Colors.blueAccent,
                                        ),

                                        SizedBox(width: 10.w),

                                        Text(
                                          'First Purchase',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              0,
                                              0,
                                              0,
                                            ),
                                            fontFamily: 'Raleway',
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '5% off for your next order',
                                          style: TextStyle(
                                            fontFamily: 'RalewayRegular',
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Transform.translate(
                                          offset: Offset(0, 0.h),
                                          child: SizedBox(
                                            height: 30.h,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueAccent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        5.r,
                                                      ),
                                                ),
                                              ),

                                              child: Text(
                                                'Apply',
                                                style: TextStyle(
                                                  fontFamily: 'RalewayRegular',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15.h),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: Size(356.w, 100.h),
                            painter: ClippedBorderPainter(
                              clipRadius: 10.0,
                              borderColor: Colors
                                  .blueAccent, // Color for the rounded clip borders
                              borderWidth: 3.w,
                            ),
                          ),
                          ClippedVoucher(
                            width: 356.w,
                            height: 130.h,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.blueAccent,
                                  width: 2.w,
                                ),
                              ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 5.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Voucher',
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 18.sp,
                                            color: Colors.blueAccent,
                                          ),
                                        ),

                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                            vertical: 5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFF9F9F),
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                          ),

                                          child: Text(
                                            'Valid Until 6.20.20',
                                            style: TextStyle(
                                              fontFamily: 'RalewayRegular',
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 0.3.w),
                                    child: DottedLine(
                                      direction: Axis.horizontal,
                                      lineLength: double.infinity,
                                      lineThickness: 2.0,
                                      dashLength: 4.0,
                                      dashColor: Colors.blueAccent,
                                      dashGapLength: 4.0,
                                      dashGapColor: Colors.transparent,
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 20.h,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.volunteer_activism_sharp,
                                          size: 22.sp,
                                          color: Colors.blueAccent,
                                        ),

                                        SizedBox(width: 10.w),

                                        Text(
                                          'Gift From Customer Care',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              0,
                                              0,
                                              0,
                                            ),
                                            fontFamily: 'Raleway',
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '15% off your next purchase',
                                          style: TextStyle(
                                            fontFamily: 'RalewayRegular',
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Transform.translate(
                                          offset: Offset(0, 0.h),
                                          child: SizedBox(
                                            height: 30.h,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueAccent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        5.r,
                                                      ),
                                                ),
                                              ),

                                              child: Text(
                                                'Apply',
                                                style: TextStyle(
                                                  fontFamily: 'RalewayRegular',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Active Vouchers',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 22.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

double _responsiveedit(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  if (height > Breakpoints.extraLarge) return 30.h;
  if (height < Breakpoints.doublesmall) return 15.h;
  return 20.h;
}

double _responsivesize(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  if (height < Breakpoints.extraSmall) return 70.h;
  if (height < Breakpoints.smallPhone) return 60.h;
  if (height < Breakpoints.largePhone) return 70.h;
  if (height < Breakpoints.extraLarge) return 75.h;
  return 60.h;
}

double _responsiveNavIconsheight(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  if (height < Breakpoints.smallPhone) return 25.h;

  if (height < Breakpoints.largePhone) return 30.h;

  if (height > Breakpoints.extraLarge) return 60.h;

  return 55.h;
}

double _responsiveNavIconswidth(BuildContext context) {
  final height = MediaQuery.of(context).size.width;

  if (height < Breakpoints.smallPhone) return 25.w;

  if (height < Breakpoints.largePhone) return 30.w;

  if (height > Breakpoints.extraLarge) return 60.w;
  return 55.h;
}

class ClippedVoucher extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double clipRadius;

  const ClippedVoucher({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.clipRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VoucherClipper(clipRadius: clipRadius),
      child: SizedBox(width: width, height: height, child: child),
    );
  }
}

class VoucherClipper extends CustomClipper<Path> {
  final double clipRadius;

  VoucherClipper({required this.clipRadius});

  @override
  Path getClip(Size size) {
    final path = Path();
    final centerY = size.height / 2;

    // Start from top-left corner
    path.moveTo(0, 0);

    // Top edge
    path.lineTo(size.width, 0);

    // Right edge to center clip
    path.lineTo(size.width, centerY - clipRadius);

    // Right center clip (semicircle)
    path.arcToPoint(
      Offset(size.width, centerY + clipRadius),
      radius: Radius.circular(clipRadius),
      clockwise: false,
    );

    // Right edge from center clip to bottom
    path.lineTo(size.width, size.height);

    // Bottom edge
    path.lineTo(0, size.height);

    // Left edge to center clip
    path.lineTo(0, centerY + clipRadius);

    // Left center clip (semicircle)
    path.arcToPoint(
      Offset(0, centerY - clipRadius),
      radius: Radius.circular(clipRadius),
      clockwise: false,
    );

    // Left edge from center clip to top
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClippedBorderPainter extends CustomPainter {
  final double clipRadius;
  final Color borderColor;
  final double borderWidth;

  ClippedBorderPainter({
    required this.clipRadius,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final centerY = size.height / 2;

    // Draw left semicircle border
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, centerY), radius: clipRadius),
      -math.pi / 2, // Start angle (top)
      math.pi, // Sweep angle (semicircle)
      false,
      paint,
    );

    // Draw right semicircle border
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width, centerY), radius: clipRadius),
      math.pi / 2, // Start angle (bottom)
      math.pi, // Sweep angle (semicircle)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
