import 'package:e_commercehybrid/Model/selectproduct_model.dart';
import 'package:e_commercehybrid/ViewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_commercehybrid/constantsize.dart';

class StartScreen extends ConsumerWidget {
  @override
  StartScreen({super.key});

  final currentIndex = StateProvider<int>((ref) => 0);
  final selectnavIndex = StateProvider<int>((ref) => 0);

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

  final List<Map<String, String>> carouselpromo = [
    {
      "img": 'assets/promo1.jpg',
      "promodescription": 'Big sale\nup to 50%\nHappening Now',
    },
    {
      "img": 'assets/promo2.jpg',
      "promodescription": 'New Arrival\nTrendy Styles\nShop Now',
    },
    {
      "img": 'assets/promo3.jpg',
      "promodescription": 'Limited Offer\nBuy 1 Get 1\nThis Week Only',
    },
    {
      "img": 'assets/promo4.jpg',
      "promodescription": 'Flash Deal\nUp to 70% Off\nToday Only',
    },
  ];

  final List<Map<String, dynamic>> live = [
    {"img": 'assets/sampleitem2.jpeg'},
    {"img": 'assets/sampleitem3.jpeg'},
    {"img": 'assets/sampleitem4.jpg'},
    {"img": 'assets/sampleitem5.jpg'},
  ];

  final List<Map<String, dynamic>> flashsale = [
    {"img": 'assets/sampleitem2.jpeg'},
    {"img": 'assets/sampleitem3.jpeg'},
    {"img": 'assets/sampleitem4.jpg'},
    {"img": 'assets/sampleitem5.jpg'},
    {"img": 'assets/sampleitem4.jpg'},
    {"img": 'assets/sampleitem5.jpg'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryproduct = ref.watch(categoryProvider);
    final activeIndex = ref.watch(currentIndex);
    final recommendation = ref.watch(recommendationProvider);
    final largePhone = MediaQuery.of(context).size.height > 800;
    final extralargePhone = MediaQuery.of(context).size.height > 900;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 10.w,
                    vertical: 25.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Shop',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 38.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10.w),

                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsetsGeometry.symmetric(
                                vertical: 5.h,
                                horizontal: 10.w,
                              ),
                              hintText: 'Search...',
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt_outlined),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.r),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                CarouselSlider.builder(
                  itemCount: carouselpromo.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                        final promo = carouselpromo[index];
                        final description = promo['promodescription']!;
                        final details = description.split('\n');
                        return GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: largePhone ? 350.w : 300.w,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        child: Image.asset(
                                          promo['img']!,
                                          height: 180.h,
                                          width: largePhone ? 350.w : 300.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      Container(
                                        height: 180.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          color: Colors.black.withValues(
                                            alpha: 0.3,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 16.h,
                                        left: 16.w,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: details.isNotEmpty
                                                    ? '${details[0]}\n'
                                                    : '',
                                                style: TextStyle(
                                                  fontFamily: 'Raleway',
                                                  fontSize: 35.sp,
                                                  color: const Color.fromARGB(
                                                    255,
                                                    255,
                                                    255,
                                                    255,
                                                  ),
                                                ),
                                              ),
                                              WidgetSpan(
                                                child: SizedBox(height: 45.h),
                                              ),

                                              TextSpan(
                                                text: details.length > 1
                                                    ? details
                                                          .sublist(1)
                                                          .join('\n')
                                                    : '',
                                                style: TextStyle(
                                                  fontFamily: 'RalewayRegular',
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
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
                  options: CarouselOptions(
                    height: 200.h,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      ref.read(currentIndex.notifier).state = index;
                    },
                  ),
                ),

                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: carouselpromo.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10.w,
                    dotWidth: 10.w,
                    activeDotColor: Color(0xFF9775FA),
                    dotColor: Colors.grey.shade300,
                  ),
                ),

                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 15.w,
                    vertical: 0.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {},

                        child: SizedBox(
                          height: 28.h,
                          width: 28.w,
                          child: Image.asset('assets/filter.png'),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5.h),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 25.w,
                    vertical: 0.h,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: categoryproduct.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: extralargePhone ? 0.85 : 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final sample = categoryproduct[index];
                      final List<String> images = List<String>.from(
                        sample.image,
                      );
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 15),
                            ],
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                spacing: 7,
                                runSpacing: 7,
                                children: List.generate(
                                  images.length > 4 ? 4 : images.length,
                                  (imgindex) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.asset(
                                        images[imgindex],
                                        width: 60.w,
                                        height: 60.h,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    sample.category?.toString() ?? '',
                                    style: TextStyle(
                                      fontFamily: 'RalewayRegular',
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),
                                  ),

                                  Container(
                                    height: 25.h,
                                    width: 50.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),

                                    child: Text(
                                      sample.noItems?.toString() ?? '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'RalewayRegular',
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 30.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stories',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, _) => SizedBox(width: 15.w),
                    itemCount: live.length,
                    itemBuilder: (context, index) {
                      final liveimg = live[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                          height: 175.h,
                          width: 125.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.r),
                            child: Image.asset(
                              liveimg['img']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 25.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Flash Sale',
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 22.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 25.sp,
                              color: Colors.blueAccent,
                            ),

                            Row(
                              children: List.generate(
                                3,
                                (index) => Container(
                                  margin: EdgeInsets.only(left: 5.w),
                                  alignment: Alignment.center,
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Color(0xFFF3F3F3),
                                  ),
                                  child: Text(
                                    '69',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 18.sp,
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
                ),

                SizedBox(height: 15.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SizedBox(
                    height: 280.h,
                    child: GridView.builder(
                      itemCount: flashsale.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final fimage = flashsale[index];
                        return GestureDetector(
                          onTap: () {
                            context.go('/flashsale');
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 150.h,
                                width: 120.w,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 2.w,
                                  vertical: 2.h,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                  horizontal: 5.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    fimage['img'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Positioned(
                                left: 68.5.w,
                                top: 6.5.h,
                                child: Container(
                                  height: 25.h,
                                  width: 45.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFF5790), // Pink
                                    Color(0xFFF81140),
                                  ],
                                ),
                                    borderRadius: BorderRadius.circular(5.r),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '20%',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'For You',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 25.sp,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(width: 120.w),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

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
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: _responsiveforyou(context),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: recommendation.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final newProduct = recommendation[index];
                      return GestureDetector(
                        onTap: () {
                          ref
                              .read(selectedproductProvider.notifier)
                              .state = SelectproductModel(
                            id: newProduct.id,
                            image: newProduct.image,
                            subimage: newProduct.subimage,
                            title: newProduct.title,
                            price: newProduct.price,
                            material: newProduct.material,
                            origin: newProduct.origin,
                            size: newProduct.size,
                            color: newProduct.color,
                          );
                          context.go('/chooseproduct');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 8),
                            ],
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 125.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    topRight: Radius.circular(5.r),
                                  ),

                                  image: DecorationImage(
                                    image: AssetImage(newProduct.image[0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),

                              Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: Text(
                                  newProduct.title,
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      index < (newProduct.rating ?? 0)
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 15.sp,
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 15.w,
                                ),
                                child: Text(
                                  newProduct.price,
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 90.h),
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

                          switch (index) {
                            case 0:
                              context.go('/startscreen');
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
                                height: extralargePhone ? 35.w : 35.w,
                                width: extralargePhone ? 35.w : 35.w,
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
    );
  }
}

double _responsiveforyou(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  if (height > Breakpoints.xxLarge) return 2 / 2.6;
  if (height > Breakpoints.largePhone) return 2 / 2.7;
  if (height > Breakpoints.xxsmall) return 2 / 2.55;
  if (height < Breakpoints.eextraSmall) return 2 / 2.3;
  if (height > Breakpoints.smallPhone) return 2 / 2.63;
  if (height > Breakpoints.extraSmall) return 2 / 2.8;
  if (height < Breakpoints.doublesmall) return 2 / 2.5;
  return 2 / 2.5;
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
  final height = MediaQuery.of(context).size.width;

  if (height < Breakpoints.smallPhone) return 25.w;

  if (height < Breakpoints.largePhone) return 30.w;

  if (height > Breakpoints.extraLarge) return 60.w;
  return 55.h;
}
