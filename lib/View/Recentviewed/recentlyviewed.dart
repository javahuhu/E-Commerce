import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RecentviewScreen extends StatefulWidget {
  const RecentviewScreen({super.key});

  @override
  State<RecentviewScreen> createState() => _RecentviewScreenState();
}

class _RecentviewScreenState extends State<RecentviewScreen> {
  int selectnavIndex = 2;
  DateTime? _selectedDate;

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_selectedDate == null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  int selectIndex = -1;
  final List<Map<String, dynamic>> recentview = [
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
    {
      "img": 'assets/sampleitem2.jpeg',
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": '\$17.00',
    },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 25.h,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recently viewed',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 25.h,
                        width: 135.w,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectIndex = selectIndex == 0 ? -1 : 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: selectIndex == 0
                                ? const Color.fromARGB(199, 255, 159, 159)
                                : Color(0xFFF9F9F9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),

                            elevation: 0,
                            padding: EdgeInsets.only(left: 46.w),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontFamily: 'RalewayRegular',
                                ),
                              ),

                              SizedBox(width: 20.w),

                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                transitionBuilder: (child, animation) =>
                                    ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),

                                child: selectIndex == 0
                                    ? Container(
                                        height: 25.w,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),

                                        child: Icon(
                                          Icons.check,
                                          size: 20.sp,
                                          color: Colors.white,
                                        ),
                                      )
                                    : SizedBox(
                                        key: ValueKey('empty'),
                                        width: 24.w,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25.h,
                        width: 135.w,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectIndex = selectIndex == 1 ? -1 : 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: selectIndex == 1
                                ? const Color.fromARGB(199, 255, 159, 159)
                                : Color(0xFFF9F9F9),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            elevation: 0,
                            padding: EdgeInsets.only(left: 35.w),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Yesterday',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontFamily: 'RalewayRegular',
                                ),
                              ),
                              SizedBox(width: 3.w),

                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                transitionBuilder: (child, animation) =>
                                    ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),

                                child: selectIndex == 1
                                    ? Container(
                                        key: ValueKey('check'),
                                        height: 25.w,
                                        width: 25.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xFFFF9F9F),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 15.sp,
                                          color: Colors.white,
                                        ),
                                      )
                                    : SizedBox(
                                        key: ValueKey('empty'),
                                        width: 24.w,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 30.w,
                        width: 30.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF9775FA),
                        ),

                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: _selectDate,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 22.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: recentview.length,
                    itemBuilder: (context, index) {
                      final image = recentview[index];
                      final details = recentview[index];
                      final amount = recentview[index];

                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7.r),
                              child: Image.asset(
                                image['img'],
                                height: 130.h,
                                width: 150.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              details['title'],
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          SizedBox(height: 5.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                amount['price'],
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 15.sp,
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

                SizedBox(height: 70.h),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Container(
                height: 50.h,
                padding: EdgeInsets.all(12.0),
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
                        setState(() {
                          selectnavIndex = index;

                          if (selectnavIndex == 1) {
                            context.go('/startscreen');
                          }

                          if (selectnavIndex == 2) {
                            context.go('/wishlist');
                          }

                          if (selectnavIndex == 3) {
                            context.go('/cart');
                          }

                          if (selectnavIndex == 4) {
                            context.go('/profile');
                          }
                        });
                      },

                      child: item['type'] == 'profile'
                          ? Container(
                              height: 30.w,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                  color: selectnavIndex == index
                                      ? Colors.white
                                      : Color(0xFF9775FA),
                                  width: 2.5.w,
                                ),
                              ),

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: Image.asset(
                                  item['iconsdefault'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 25.h,
                              width: 25,
                              child: Image.asset(
                                selectnavIndex == index
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
    );
  }
}
