import 'package:e_commercehybrid/Model/addtocart_model.dart';
import 'package:e_commercehybrid/ViewModel/addtocart_view_model.dart';
import 'package:e_commercehybrid/ViewModel/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends ConsumerWidget {
  CartScreen({super.key});

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

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    AddtocartModel itemcart,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete Item'),
          content: Text('Are you sure you want to delete ${itemcart.title}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),

            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectnavIndex = StateProvider<int>((ref) => 3);
    final addtocart = ref.watch(addtocartProvider);
    final wishlist = ref.watch(wishlistProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(bottom: 125.h),
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

                    ...addtocart.asMap().entries.map((entry) {
                      int index = entry.key;
                      var itemcart = entry.value;

                      return Dismissible(
                        key: Key(itemcart.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 70.w),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),

                        confirmDismiss: (direction) async {
                          final bool? confirm = await _showConfirmationDialog(
                            context,
                            itemcart,
                          );
                          return confirm ?? false;
                        },

                        onDismissed: (direction) {
                          ref.read(addtocartProvider.notifier).onDelete(index);
                        },
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
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),

                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.asset(
                                      itemcart.image,
                                      height: 100.h,
                                      width: 120.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  // Padding(
                                  //   padding: EdgeInsets.only(
                                  //     top: 62.h,
                                  //     left: 8.w,
                                  //   ),
                                  //   child: Container(
                                  //     height: 35.w,
                                  //     width: 35.w,
                                  //     alignment: Alignment.center,
                                  //     decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       shape: BoxShape.circle,
                                  //     ),

                                  //     child: Image.asset(
                                  //       'assets/trash.png',
                                  //       height: 15.h,
                                  //       width: 15.w,
                                  //       fit: BoxFit.contain,
                                  //     ),
                                  //   ),
                                  // ),
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
                                      itemcart.title,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: 15.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          itemcart.color,
                                          style: TextStyle(
                                            fontFamily: 'RalewayRegyular',
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        ),

                                        SizedBox(width: 10.w),

                                        Text(
                                          itemcart.size,
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
                                    padding: EdgeInsets.only(top: 13.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          itemcart.price,
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
                      );
                    }),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ),
                        child: Text(
                          'From Your Wishlist',
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    ...wishlist.asMap().entries.map((entry) {
                      var list = entry.value;

                      return Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 12.h,
                            ),
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5),
                              ],
                            ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.asset(
                                list.image,
                                height: 100.h,
                                width: 120.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list.title,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),

                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 10.h),

                                Text(
                                  list.price,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20.sp,
                                    color: Colors.black,
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
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                        color: Color(0xFFE5EBFC),
                                      ),

                                      child: Text(
                                        list.color,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10.w),

                                    Container(
                                      height: 25.h,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5EBFC),
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                      ),

                                      child: Text(
                                        list.size,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
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
                      );
                    }),
                  ],
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 60.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9F9F),
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10
                      )
                    ]
                  ),

                  child: 
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15.w), child: 
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total \$17.00',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)
                          )
                        ),
                        child: Text('Checkout', style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        )),
                      ),
                    ],
                  ),)
               
                ),
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
          ],
        ),
      ),
    );
  }
}
