import 'package:e_commercehybrid/Model/selectproduct_model.dart';
import 'package:e_commercehybrid/ViewModel/product_view_model.dart';
import 'package:e_commercehybrid/ViewModel/recentlyview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commercehybrid/constantsize.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});

  final List<IconData> iconItems = [
    Icons.qr_code,
    Icons.bookmark,
    Icons.settings,
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

  final selectIndexProvider = StateProvider<int>((ref) => 0);
  final selectnavIndex = StateProvider<int>((ref) => 0);
  final selectorderbtn = StateProvider<int>((ref) => 0);
  final selectIconItems = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newitem = ref.watch(newItemsProvider);
    final recentproduct = ref.watch(recentlyviewProvider);
    final popularproduct = ref.watch(popularItemsProvider);
    final largePhone = MediaQuery.of(context).size.height > 850;
    final mediumPhone = MediaQuery.of(context).size.height > 750;

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
                    horizontal: 10.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          height: 35.h,
                          width: 135.w,
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/myactivity');
                            },
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

                      SizedBox(
                        height: 35.w,
                        width: largePhone ? 135.w : 125.w,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: iconItems.asMap().entries.map((iconItems) {
                            final index = iconItems.key;
                            final icon = iconItems.value;
                            return GestureDetector(
                              onTap: () {
                                ref.read(selectIconItems.notifier).state =
                                    index;

                                switch (index) {
                                  case 0:
                                    context.push('/voucher');
                                    break;
                                  case 1:
                                    context.push('');
                                    break;
                                  case 2:
                                    context.push('/settings');
                                }
                              },

                              child: Container(
                                height: 35.w,
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
                                child: Icon(icon),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 0.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello Christian!',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontSize: 28.sp,
                      ),
                    ),
                  ),
                ),

                recentproduct.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: 25.w,
                          top: 25.h,
                          bottom: 15.h,
                        ),
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
                      )
                    : SizedBox.shrink(),

                recentproduct.isNotEmpty
                    ? SizedBox(
                        height: 60.w,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          separatorBuilder: (_, _) => SizedBox(width: 15.w),
                          itemCount: recentproduct.length,
                          itemBuilder: (context, index) {
                            final recent = recentproduct[index];
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(selectedproductProvider.notifier)
                                    .state = SelectproductModel(
                                  id: recent.id,
                                  mainimage: recent.image[0],
                                  image: recent.image,
                                  subimage: recent.subimage,
                                  title: recent.title,
                                  price: recent.price,
                                  material: recent.material,
                                  origin: recent.origin,
                                  size: recent.size,
                                  selectedSize: recent.size[0],
                                  color: recent.color,
                                );

                                context.go('/chooseproduct');
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                                height: 60.w,
                                width: 55.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),

                                child: ClipOval(
                                  child: Image.asset(
                                    recent.image[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox.shrink(),

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
                    left: 20.w,
                    top: 15.h,
                    right: 5.w,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(orderbtn.length, (index) {
                        return SizedBox(
                          height: 45.h,
                          width: 108.w,
                          child: ElevatedButton(
                            onPressed: () {
                              ref.read(selectorderbtn.notifier).state = index;

                              switch (index) {
                                case 0:
                                  context.go('/topay');
                                  break;
                                case 1:
                                  context.go('/torecieved');
                                  break;
                                case 2:
                                  context.go('/toreview');
                                  break;
                              }
                            },
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
                    padding: EdgeInsets.only(left: 25.w, right: 22.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                SizedBox(
                  height: 178.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    itemCount: newitem.length,
                    separatorBuilder: (_, _) => SizedBox(width: 15.w),
                    itemBuilder: (context, index) {
                      final img = newitem[index];
                      final txt = newitem[index];
                      final newproduct = newitem[index];
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(selectedproductProvider.notifier)
                              .state = SelectproductModel(
                            id: txt.id,
                            mainimage: txt.image[0],
                            image: img.image,
                            subimage: img.subimage,
                            title: txt.title,
                            price: txt.price,
                            material: txt.material,
                            origin: txt.origin,
                            size: txt.size,
                            selectedSize: txt.size[0],
                            color: txt.color,
                          );

                          ref
                              .read(recentlyviewProvider.notifier)
                              .addtoViewed(newproduct);

                          context.go('/chooseproduct');
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5.h),
                              height: 120.h,
                              width: 140.w,
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
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    img.image[0],
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
                                  txt.title,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 22.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),
                SizedBox(
                  height: mediumPhone ? 165.h : 192.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    separatorBuilder: (_, _) => SizedBox(width: 15.w),
                    itemCount: popularproduct.length,
                    itemBuilder: (context, index) {
                      final popular = popularproduct[index];
                      final desc = popularproduct[index];
                      final event = popularproduct[index];
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(selectedproductProvider.notifier)
                              .state = SelectproductModel(
                            id: popular.id,
                            mainimage: popular.image[0],
                            image: popular.image,
                            subimage: popular.subimage,
                            title: popular.title,
                            price: popular.price,
                            material: popular.material,
                            origin: popular.origin,
                            size: popular.size,
                            selectedSize: popular.size[0],
                            color: popular.color,
                          );

                          ref
                              .read(recentlyviewProvider.notifier)
                              .addtoViewed(popular);

                          context.push('/chooseproduct');
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                          padding: EdgeInsets.symmetric(vertical: 5.h),
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
                                  child: Image.asset(popular.image[0]),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Text(
                                      desc.likes?.toString() ?? '',
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
                                      event.event?.toString() ?? '',
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
                      );
                    },
                  ),
                ),

                SizedBox(height: 150.h),
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
                                height: 35.w,
                                width: 35.w,
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
                                height: _responsiveNavIconsheight(context),
                                width: _responsiveNavIconswidth(context),
                                child: Image.asset(item['iconsdefault']),
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
    );
  }
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
  if (height < Breakpoints.smallPhone) return 30.h;

  if (height < Breakpoints.largePhone) return 35.h;

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
