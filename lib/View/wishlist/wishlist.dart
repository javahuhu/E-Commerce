import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int selectnavIndex = 2;

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

  List<Map<String, dynamic>> products = [
    {
      "image": "assets/sampleitem2.jpeg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$17.00",
      "color": "Pink",
      "size": "M",
    },
    {
      "image": "assets/sampleitem3.jpeg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$32.50",
      "color": "White",
      "size": "L",
    },

    {
      "image": "assets/sampleitem4.jpg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$17.00",
      "color": "Pink",
      "size": "M",
    },
    {
      "image": "assets/sampleitem3.jpeg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$32.50",
      "color": "White",
      "size": "L",
    },

    {
      "image": "assets/sampleitem3.jpeg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$17.00",
      "color": "Pink",
      "size": "M",
    },
    {
      "image": "assets/sampleitem3.jpeg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$32.50",
      "color": "White",
      "size": "L",
    },

    {
      "image": "assets/sampleitem3.jpeg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$17.00",
      "color": "Pink",
      "size": "M",
    },
    {
      "image": "assets/sampleitem3.jpeg",
      "title": "Lorem ipsum dolor sit amet consectetur.",
      "price": "\$32.50",
      "color": "White",
      "size": "L",
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 70.h),
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 25.h,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Wishlist',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontFamily: 'RalewayRegular',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently viewed',
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                            color: Colors.black,
                          ),
                        ),

                        Container(
                          height: 30.w,
                          width: 30.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF9775FA),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              context.go('/recentviewed');
                            },

                            icon: Icon(
                              Icons.arrow_right_alt_sharp,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),

                  SizedBox(
                    height: 60.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      separatorBuilder: (_, __) => SizedBox(width: 15.w),
                      itemCount: recentimg.length,
                      itemBuilder: (context, index) {
                        final recent = recentimg[index];
                        return Container(
                          margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                          height: 60.w,
                          width: 60.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 3.w),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),

                          child: ClipOval(
                            
                            child: Image.asset(
                              recent['img']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 15.h),

                  ...products.map(
                    (item) => GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 12.h,
                            ),
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 8),
                              ],
                            ),

                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    item['image'],
                                    height: 100.h,
                                    width: 120.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(padding: EdgeInsets.only(top: 62.h, left: 8.w), child: 
                                Container(
                                  height: 35.w,
                                  width: 35.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),

                                  child: ClipRRect(
                                    child: Image.asset('assets/trash.png', height: 15.h, width: 15.w,fit: BoxFit.contain,),
                                  ),
                                )),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: Text(
                                    item['title'],
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 10.h),

                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    item['price'],
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Container(
                                      height: 25.h,
                                      width: 50.w,
                                      alignment: Alignment.center,

                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5EBFC),
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                      ),

                                      child: Text(
                                        item['color'],
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                    SizedBox(width: 10.w),

                                    Container(
                                      height: 25.h,
                                      width: 50.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                        color: Color(0xFFE5EBFC),
                                      ),

                                      child: Text(
                                        item['size'],
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                    SizedBox(width: 50.w),

                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 27.h,
                                        width: 27.w,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/addtocart.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
            ],
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

                          if (selectnavIndex == 0) {
                            context.go('/startscreen');
                          }

                          if (selectnavIndex == 1) {
                            context.go('/');
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
