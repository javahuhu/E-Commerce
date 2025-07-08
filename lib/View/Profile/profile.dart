import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});

  final List<IconData> iconItems = [
    Icons.qr_code,
    Icons.bookmark,
    Icons.settings,
  ];

  final List<Map<String, String>> recentimg = [
    {"img": 'assets/sampleitem2.jpeg',},
    {"img": 'assets/sampleitem3.jpeg', },
    {"img": 'assets/sampleitem4.jpg', },
    {"img": 'assets/sampleitem5.jpg', },
    {"img": 'assets/sampleitem2.jpeg', },
    {"img": 'assets/sampleitem3.jpeg', },
    {"img": 'assets/sampleitem4.jpg', },
    {"img": 'assets/sampleitem5.jpg', },
    {"img": 'assets/sampleitem2.jpeg', },
    {"img": 'assets/sampleitem3.jpeg', },
    {"img": 'assets/sampleitem4.jpg', },
    {"img": 'assets/sampleitem5.jpg', },
  ];

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

  final List<Map<String, dynamic>> orderbtn = [
    {"text": 'Pay'},

    {"text": 'Recieved'},

    {"text": 'Review'},
  ];

  final List<Map<String, String>> newitems = [
    {
      "newimg": 'assets/sampleitem2.jpeg',
      "description": 'Lorem ipsum dolor sit amet consectetur.',
    },
    {
      "newimg": 'assets/sampleitem2.jpeg',
      "description": 'Lorem ipsum dolor sit amet consectetur.',
    },
    {
      "newimg": 'assets/sampleitem2.jpeg',
      "description": 'Lorem ipsum dolor sit amet consectetur.',
    },
    {
      "newimg": 'assets/sampleitem2.jpeg',
      "description": 'Lorem ipsum dolor sit amet consectetur.',
    },
    {
      "newimg": 'assets/sampleitem2.jpeg',
      "description": 'Lorem ipsum dolor sit amet consectetur.',
    },
    {
      "newimg": 'assets/sampleitem2.jpeg',
      "description": 'Lorem ipsum dolor sit amet consectetur.',
    },
    {
      "newimg": 'assets/sampleitem2.jpeg',
      "description": 'Lorem ipsum dolor sit amet consectetur.',
    },
  ];

  final List<Map<String, dynamic>> popularimg = [
    {"popular": 'assets/sampleitem2.jpeg', "like": '1700', "event": 'Sale'},
    {"popular": 'assets/sampleitem2.jpeg', "like": '1700', "event": 'Sale'},
    {"popular": 'assets/sampleitem2.jpeg', "like": '1700', "event": 'Sale'},
    {"popular": 'assets/sampleitem2.jpeg', "like": '1700', "event": 'Sale'},
    {"popular": 'assets/sampleitem2.jpeg', "like": '1700', "event": 'Sale'},
    {"popular": 'assets/sampleitem2.jpeg', "like": '1700', "event": 'Sale'},
  ];

  final selectIndexProvider = StateProvider<int>((ref) => 0);
  final selectnavIndex = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 25.h,
                    horizontal: 15.w,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Colors.white, width: 5.w),
                          boxShadow: [
                            BoxShadow(color: Colors.black45, blurRadius: 5),
                          ],
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image(
                            image: AssetImage('assets/testprofile.jpg'),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 15.w),
                        child: SizedBox(
                          height: 30.h,
                          width: 135.w,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF9F9F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(
                                  50.r,
                                ),
                              ),
                            ),
                            child: Text(
                              'My Activity',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 13.w),

                      SizedBox(
                        height: 35.h,
                        width: 100.h,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: iconItems.map((iconItems) {
                            return GestureDetector(
                              onTap: () {},

                              child: Container(
                                height: 30.h,
                                width: 35.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    235,
                                    234,
                                    234,
                                  ),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: Icon(iconItems),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 25.h, bottom: 15.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recently viewed',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    separatorBuilder: (_, __) => SizedBox(width: 15.w),
                    itemCount: recentimg.length,
                    itemBuilder: (context, index) {
                      final recent = recentimg[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 3.h,bottom: 3.h),
                          height: 60.w,
                          width: 60.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3.w),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),

                          child: ClipOval(
                            child: Image.asset(
                              recent['img']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 25.5.w, top: 25.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My order',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 24.w,
                    top: 15.h,
                    right: 5.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(orderbtn.length, (index) {
                        return SizedBox(
                          height: 30.h,
                          width: 105.w,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE5EBFC),
                              foregroundColor: Color(0xFF9775FA),
                              shadowColor: Colors.transparent,
                              overlayColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                            child: Text(
                              orderbtn[index]['text'],
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),

                SizedBox(height: 25.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'New Items',
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 22.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 100.w),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 14.w),

                          Container(
                            height: 30.w,
                            width: 30.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Color(0xFF9775FA),
                            ),

                            child: Icon(
                              Icons.arrow_right_alt_sharp,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                SizedBox(
                  height: 170.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    itemCount: newitems.length,
                    separatorBuilder: (_, __) => SizedBox(width: 15.w),
                    itemBuilder: (context, index) {
                      final img = newitems[index];
                      final txt = newitems[index];
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            height: 120.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.asset(
                                  img['newimg']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 140.w,
                            child: Padding(
                              padding: EdgeInsets.only(right: 3.w, top: 10.h),
                              child: Text(
                                txt['description']!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'Most Popular',
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 22.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 75.w),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 14.w),

                          Container(
                            height: 30.w,
                            width: 30.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Color(0xFF9775FA),
                            ),
                            child: Icon(
                              Icons.arrow_right_alt_sharp,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),
                SizedBox(
                  height: 150.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    separatorBuilder: (_, __) => SizedBox(width: 15.w),
                    itemCount: popularimg.length,
                    itemBuilder: (context, index) {
                      final popular = popularimg[index];
                      final desc = popularimg[index];
                      final event = popularimg[index];
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            height: 130.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5),
                              ],
                            ),

                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(popular['popular']!),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        desc['like']!,
                                        style: TextStyle(
                                          fontFamily: 'RalewayRegular',
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Icon(
                                        Icons.favorite,
                                        size: 15.sp,
                                        color: Colors.red,
                                      ),

                                      SizedBox(width: 10.8.w),

                                      Text(
                                        event['event']!,
                                        style: TextStyle(
                                          fontFamily: 'RalewayRegular',
                                          fontSize: 13.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: 100.h),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Container(
                height: 50.h,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: Color(0xFF9775FA),
                  borderRadius: BorderRadius.circular(24.r),
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

                        if (ref.watch(selectnavIndex) == 0) {
                          context.go('/startscreen');
                        }

                        if (ref.watch(selectnavIndex) == 1) {
                          context.go('/');
                        }

                        if (ref.watch(selectnavIndex) == 2) {
                          context.go('/wishlist');
                        }

                        if (ref.watch(selectnavIndex) == 3) {
                          context.go('/cart');
                        }

                        if (ref.watch(selectnavIndex) == 4) {
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
                                  color: ref.watch(selectnavIndex) == index
                                      ? Color(0xFF9775FA)
                                      : Colors.white,
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
                              height: 25.h,
                              width: 25.w,
                              child: Image.asset(item['iconsdefault']),
                            ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
