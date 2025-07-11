import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commercehybrid/constantsize.dart';

class PaymentScreen extends ConsumerWidget {
  @override
  PaymentScreen({super.key});

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
                                right: 5.w,
                                top: extraLarge ? 30.h : 20.h,
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
                                right: 5.w,
                                top: extraLarge ? 30.h : 20.h,
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
                                fontSize: 30.sp,
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
                            onPressed: () {},
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
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
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
                                  height: 30.w,
                                  width: 30.w,
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

double _responsivesize(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  if (height < Breakpoints.smallPhone) return 60.h;
  if (height < Breakpoints.largePhone) return 60.h;
  if (height > Breakpoints.extraLarge) return 75.h;
  return 55.h;
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
