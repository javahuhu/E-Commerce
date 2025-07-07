import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartScreen extends StatefulWidget {
  @override
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int selectIndex = 0;
  int currentIndex = 0;

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

  final List<Map<String, String>> product = [
    {"img": 'assets/sampleitem.jpeg'},

    {"img": 'assets/sampleitem.jpeg'},

    {"img": 'assets/sampleitem.jpeg'},

    {"img": 'assets/sampleitem.jpeg'},
    {"img": 'assets/sampleitem.jpeg'},
    {"img": 'assets/sampleitem.jpeg'},
  ];

  final List<Map<String, String>> product1 = [
    {"img": 'assets/sampleitem2.jpeg', "title": 'Shoes', "noItems": '109'},
    {"img": 'assets/sampleitem3.jpeg', "title": 'Clothes', "noItems": '109'},
    {"img": 'assets/sampleitem4.jpg', "title": 'Dress', "noItems": '109'},
    {"img": 'assets/sampleitem5.jpg', "title": 'T-Shirt', "noItems": '109'},
  ];

  @override
  Widget build(BuildContext context) {
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
                    horizontal: 25.w,
                    vertical: 25.h,
                  ),
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
                            width: 300.w,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(10.r),
                                        child: Image.asset(
                                          promo['img']!,
                                          height: 130.h,
                                          width: 300.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      Container(
                                        height: 130.h,
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
                    height: 150.h,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),

                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
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

                SizedBox(height: 25.h),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 25.w,
                    vertical: 0.h,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: product1.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final sample = product1[index];
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
                                spacing: 5,
                                runSpacing: 5,
                                children: List.generate(4, (index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      8.r,
                                    ),
                                    child: Image.asset(
                                      sample['img']!,
                                      width: 60.w,
                                      height: 60.h,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }),
                              ),

                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    sample['title']!,
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
                                      sample['noItems']!,
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

                SizedBox(height: 25.h),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.5,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                    itemCount: product.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final newProduct = product[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 8),
                          ],
                        ),

                        child: Column(
                          children: [
                            Container(
                              height: 110.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  topRight: Radius.circular(5.r),
                                ),

                                image: DecorationImage(
                                  image: AssetImage(newProduct['img']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            SizedBox(height: 5),

                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 15.w,
                              ),
                              child: Text(
                                'Soft Violet Everyday Shirt',
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            SizedBox(height: 2),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 15.w,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4 ? Icons.star : Icons.star_border,
                                    color: Colors.amber,
                                    size: 15.sp,
                                  );
                                }),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 15.w,
                              ),
                              child: Text(
                                '₱250',
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
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
                          context.go('/');
                        }

                        if (selectIndex == 2) {
                          context.go('/');
                        }

                        if (selectIndex == 3) {
                          context.go('/');
                        }

                        if (selectIndex == 4) {
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
                                  color: selectIndex == index
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
