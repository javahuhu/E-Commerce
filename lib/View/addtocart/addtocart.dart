import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int selectIndex = 3;

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

  final List<Map<String, String>> product = [
    {
      "img": 'assets/sampleitem.jpeg',
      "title": 'Lorem ipsum dolor sit amet consectetur.',
      "price": "\$32.50",
      "color": 'Purple',
      "size": 'Size M',
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "title": 'Lorem ipsum dolor sit amet consectetur.',
      "price": "\$32.50",
      "color": 'Purple',
      "size": 'Size M',
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "title": 'Lorem ipsum dolor sit amet consectetur.',
      "price": "\$32.50",
      "color": 'Purple',
      "size": 'Size M',
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "title": 'Lorem ipsum dolor sit amet consectetur.',
      "price": "\$32.50",
      "color": 'Purple',
      "size": 'Size M',
    },
    {
      "img": 'assets/sampleitem.jpeg',
      "title": 'Lorem ipsum dolor sit amet consectetur.',
      "price": "\$32.50",
      "color": 'Purple',
      "size": 'Size M',
    },
    {
      "img": 'assets/sampleitem.jpeg',
      "title": 'Lorem ipsum dolor sit amet consectetur.',
      "price": "\$32.50",
      "color": 'Purple',
      "size": 'Size M',
    },
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          top: 25.h,
                          right: 10.w,
                        ),
                        child: Text(
                          'Cart',
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 25.h),
                        child: Container(
                          height: 40.w,
                          width: 40.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF9775FA),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),

                          child: Text(
                            '2',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 22.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 100.h,
                    width: 350.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xFFF9F9F9),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.w, top: 15.h),
                          child: Text(
                            'Shipping Address',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 15.h),
                              child: SizedBox(
                                width: 260.w,
                                child: Text(
                                  '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city',
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              height: 35.w,
                              width: 35.w,
                              margin: EdgeInsets.only(left: 10.w, top: 25.h),
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

                  SizedBox(height: 15.h),

                  ...product.map(
                    (itemcart) => GestureDetector(
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
                                BoxShadow(color: Colors.black12, blurRadius: 8),
                              ],
                            ),

                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    itemcart['img']!,
                                    height: 100.h,
                                    width: 120.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 62.h,
                                    left: 8.w,
                                  ),
                                  child: Container(
                                    height: 35.w,
                                    width: 35.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),

                                    child: Image.asset(
                                      'assets/trash.png',
                                      height: 15.h,
                                      width: 15.w,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
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
                                    itemcart['title']!,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        itemcart['color']!,
                                        style: TextStyle(
                                          fontFamily: 'RalewayRegyular',
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        ),
                                      ),

                                      SizedBox(width: 10.w),

                                      Text(
                                        itemcart['size']!,
                                        style: TextStyle(
                                          fontFamily: 'RalewayRegular',
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        itemcart['price']!,
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                        ),
                                      ),

                                      SizedBox(width: 25.w),

                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 30.w,
                                          width: 30.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/minusbtn.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 25.h,
                                        width: 35.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE5EBFC),
                                          borderRadius: BorderRadius.circular(
                                            3.r,
                                          ),
                                        ),

                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 30.h,
                                          width: 30.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/addbtn.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 5.w),
                                    ],
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
            ],
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
                        setState(() {
                          selectIndex = index;
                        });

                        if (selectIndex == 1) {
                          context.go('//startscreen');
                        }

                        if (selectIndex == 1) {
                          context.go('/');
                        }

                        if (selectIndex == 2) {
                          context.go('/wishlist');
                        }

                        if (selectIndex == 3) {
                          context.go('/cart');
                        }

                        if (selectIndex == 4) {
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
                                  color: selectIndex == index
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
                              width: 25.w,
                              child: Image.asset(
                                selectIndex == index
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
