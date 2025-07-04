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
    {"img": 'assets/sampleitem2.jpeg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem3.jpeg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem4.jpg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem5.jpg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem2.jpeg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem3.jpeg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem4.jpg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem5.jpg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem2.jpeg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem3.jpeg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem4.jpg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem5.jpg', "title": 'Shoes', "noItems": '109'},
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
                              backgroundColor: Colors.blueAccent,
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
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 14.w),

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
                                width: 30.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    235,
                                    234,
                                    234,
                                  ),
                                  borderRadius: BorderRadius.circular(25.r),
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
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 62.w,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 25.w),
                    separatorBuilder: (_, __) => SizedBox(width: 15.w),
                    itemCount: recentimg.length,
                    itemBuilder: (context, index) {
                      final recent = recentimg[index];
                      return GestureDetector(
                        onTap: () {
                          ref.read(selectIndexProvider.notifier).state = index;
                        },
                        child: Container(
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
                                context.go('/');
                              }

                              if (ref.watch(selectnavIndex) == 3) {
                                context.go('/profile');
                              }

                              if (ref.watch(selectnavIndex) == 4) {
                                context.go('/profile');
                              }
                            },

                            child: item['type'] == 'profile'
                                ? Container(
                                    height: 35.w,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(
                                        100.r,
                                      ),
                                      border: Border.all(
                                        color:
                                            ref.watch(selectnavIndex) == index
                                            ? Colors.white
                                            : Color(0xFF9775FA),
                                        width: 2.5.w,
                                      ),
                                    ),

                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(100.r),
                                      child: Image.asset(
                                        item['iconsdefault'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 25.h,
                                    width: 25.w,
                                    child: Image.asset(
                                      ref.watch(selectnavIndex) == index
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
