import 'package:e_commercehybrid/Model/product_model.dart';
import 'package:e_commercehybrid/Model/selectproduct_model.dart';
import 'package:e_commercehybrid/ViewModel/addtocart_view_model.dart';
import 'package:e_commercehybrid/ViewModel/countitem_view_model.dart';
import 'package:e_commercehybrid/ViewModel/product_view_model.dart';
import 'package:e_commercehybrid/ViewModel/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commercehybrid/constantsize.dart';

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
    Product item,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 225.h,
            width: 200.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.w),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Are you sure you want to remove',
                        style: TextStyle(
                          fontFamily: "RalewayRegular",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500.r),
                    child: Image.asset(
                      item.mainimage ?? item.image[0],
                      fit: BoxFit.cover,
                      height: 60.w,
                      width: 60.w,
                    ),
                  ),
                ),

                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontFamily: "RalewayRegular",
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.pop(false);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          elevation: WidgetStateProperty.all(0), // no shadow
                          shadowColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ), // no shadow color
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ), // 🚫 no pressed color
                          splashFactory: NoSplash.splashFactory, // 🚫 no ripple
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          context.pop(true);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          elevation: WidgetStateProperty.all(0),
                          shadowColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final selectedcartprovider = StateProvider<Set<String>>((ref) => {});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectnavIndex = StateProvider<int>((ref) => 3);
    final addtocart = ref.watch(addtocartProvider);
    final wishlist = ref.watch(wishlistProvider);
    final popularproduct = ref.watch(popularItemsProvider);
    final extralargePhone = MediaQuery.of(context).size.height > 900;
    final mediumPhone = MediaQuery.of(context).size.height > 750;
    final selectedcart = ref.watch(selectedcartprovider);

    final cartlistselected = Provider<List<Product>>((ref) {
      final allCartItems = ref.watch(addtocartProvider);
      final theselectcart = ref.watch(selectedcartprovider);

      return allCartItems
          .where((item) => theselectcart.contains(item.id))
          .toList();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(bottom: extralargePhone ? 180.h : 135.h),
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
                              '${addtocart.length}',
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 15.h,
                      ),
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
                            padding: EdgeInsets.only(left: 15.w, top: 0.h),
                            child: Text(
                              'Shipping Address',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: extralargePhone ? 20.sp : 16.sp,
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
                                      fontFamily: 'RalewayRegular',
                                      color: Colors.black,
                                      fontSize: extralargePhone ? 15.sp : 12.sp,
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                height: 35.w,
                                width: 35.w,
                                margin: EdgeInsets.only(
                                  right: 5.w,
                                  top: extralargePhone ? 30.h : 20.h,
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

                    SizedBox(height: 15.h),
                    if (addtocart.isNotEmpty) ...[
                      ...addtocart.asMap().entries.map((entry) {
                        int index = entry.key;
                        var itemcart = entry.value;

                        final finalvalue = ref.watch(
                          quantityProvider.select(
                            (map) => map[itemcart.id] ?? 1,
                          ),
                        );

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
                            ref
                                .read(addtocartProvider.notifier)
                                .onDelete(index);
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                value: selectedcart.contains(itemcart.id),
                                onChanged: (value) {
                                  final notifier = ref.read(
                                    selectedcartprovider.notifier,
                                  );

                                  final updated = {...selectedcart};

                                  if (value == true) {
                                    updated.add(itemcart.id);
                                  } else {
                                    updated.remove(itemcart.id);
                                  }

                                  notifier.state = updated;
                                },
                              ),

                              Container(
                                margin: EdgeInsets.only(
                                  right: 5.w,
                                  top: 12.h,
                                  bottom: 12.h,
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
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(
                                              selectedproductProvider.notifier,
                                            )
                                            .state = SelectproductModel(
                                          id: itemcart.id,
                                          mainimage: itemcart.image[0],
                                          image: itemcart.image,
                                          subimage: itemcart.subimage,
                                          title: itemcart.title,
                                          price: itemcart.price,
                                          material: itemcart.material,
                                          origin: itemcart.origin,
                                          size: itemcart.size,
                                          color: itemcart.color,
                                        );
                                        context.go('/chooseproduct');
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        child: Image.asset(
                                          itemcart.mainimage ??
                                              itemcart.image[0],
                                          height: 100.h,
                                          width: 120.w,
                                          fit: BoxFit.cover,
                                        ),
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

                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
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
                                            itemcart.size[0],
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
                                            MainAxisAlignment.end,

                                        children: [
                                          Expanded(
                                            child: Text(
                                              itemcart.price,
                                              style: TextStyle(
                                                fontFamily: 'Raleway',
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              ref
                                                  .read(
                                                    quantityProvider.notifier,
                                                  )
                                                  .minus(itemcart.id);
                                            },
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

                                          SizedBox(width: 5.w),

                                          Container(
                                            height: 25.h,
                                            width: 35.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE5EBFC),
                                              borderRadius:
                                                  BorderRadius.circular(3.r),
                                            ),

                                            child: Text(
                                              '$finalvalue',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 5.w),

                                          GestureDetector(
                                            onTap: () {
                                              ref
                                                  .read(
                                                    quantityProvider.notifier,
                                                  )
                                                  .add(itemcart.id);
                                            },
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
                    ] else
                      Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Center(
                          child: Container(
                            height: 150.w,
                            width: 150.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5),
                              ],
                            ),
                            child: Image.asset(
                              'assets/addtocartnull.jpg',
                              height: 90.h,
                              width: 90.w,
                            ),
                          ),
                        ),
                      ),

                    SizedBox(height: 25.h),

                    if (wishlist.isNotEmpty) ...[
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
                    ] else
                      SizedBox(key: ValueKey('empty'), height: 20.h),

                    ...wishlist.asMap().entries.map((entry) {
                      var list = entry.value;

                      final cart = ref.read(addtocartProvider);
                      final alreadyincart = cart.any(
                        (incart) => incart.id == list.id,
                      );

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
                                list.image[0],
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
                                      width: 50.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5EBFC),
                                        borderRadius: BorderRadius.circular(
                                          3.r,
                                        ),
                                      ),

                                      child: Text(
                                        list.size[0],
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 50.w),

                                    if (!alreadyincart)
                                      GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(addtocartProvider.notifier)
                                              .addtoCart(list);
                                        },
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

                    SizedBox(height: 25.h),
                    if (wishlist.isEmpty) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Most Popular',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            Row(
                              children: [
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(width: 15.w),

                                Container(
                                  height: 30.w,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
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
                          ],
                        ),
                      ),

                      SizedBox(height: 15.h),

                      SizedBox(
                        height: mediumPhone ? 165.h : 192.h,
                        child: ListView.separated(
                          itemCount: popularproduct.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          separatorBuilder: (_, _) => SizedBox(width: 15.w),
                          itemBuilder: (context, index) {
                            final popular = popularproduct[index];
                            return Container(
                              margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.asset(popular.image[0]),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          popular.likes?.toString() ?? '',
                                          style: TextStyle(
                                            fontFamily: 'RalewayRegular',
                                            fontSize: 13.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        Icon(
                                          Icons.favorite,
                                          size: 13.sp,
                                          color: Colors.red,
                                        ),

                                        SizedBox(width: 10.w),

                                        Text(
                                          popular.event?.toString() ?? '',
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
                            );
                          },
                        ),
                      ),
                    ] else
                      SizedBox(key: ValueKey('empty')),

                    SizedBox(height: 25.h),
                  ],
                ),
              ],
            ),

            addtocart.isEmpty
                ? SizedBox.shrink(key: ValueKey('empty'))
                : Padding(
                    key: ValueKey('showbutton'),
                    padding: EdgeInsets.only(
                      bottom: extralargePhone ? 90.h : 85.h,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: extralargePhone ? 70.h : 60.h,
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF9F9F),
                          borderRadius: BorderRadius.circular(100.r),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ],
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
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
                                onPressed: selectedcart.isEmpty
                                    ? null
                                    : () async {
                                        final finalcart = ref.read(
                                          cartlistselected,
                                        );

                                        ref
                                                .read(currentPurchase.notifier)
                                                .state =
                                            finalcart;
                                        await context.push('/payment');

                                        ref
                                                .read(currentPurchase.notifier)
                                                .state =
                                            [];
                                      },
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  backgroundColor: selectedcart.isEmpty
                                      ? Colors.grey.shade300
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: selectedcart.isEmpty
                                        ? Colors.black54
                                        : Colors.black,
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
                    padding: EdgeInsets.all(12),
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
                                    borderRadius: BorderRadius.circular(100.r),
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

double _responsivesize(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  if (height < Breakpoints.extraSmall) return 60.h;
  if (height < Breakpoints.eextraSmall) return 70.h;
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
  final width = MediaQuery.of(context).size.width;

  if (width < Breakpoints.smallPhone) return 25.w;

  if (width < Breakpoints.largePhone) return 30.w;

  if (width > Breakpoints.extraLarge) return 60.w;
  return 55.w;
}
