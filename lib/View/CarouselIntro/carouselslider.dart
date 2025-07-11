import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

final List<Map<String, String>> introimg = [
  {
    "img": "assets/carousel1.png",
    "Description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.",
  },
  {
    "img": "assets/carousel2.jpg",
    "Description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.",
  },
  {
    "img": "assets/carousel3.png",
    "Description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.",
  },
  {
    "img": "assets/carousel4.jpg",
    "Description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.",
  },
];
CarouselSliderController buttonCarouselController = CarouselSliderController();

class _CarouselScreenState extends State<CarouselScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final smallPhone = MediaQuery.of(context).size.height < 700;
    final largePhone = MediaQuery.of(context).size.height > 800;
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),
      body: Stack(
        children: [
          Positioned(
            top: -25.h,
            left: -50.w,
            child: SizedBox(
              height: 300.h,
              width: 300.w,
              child: Image.asset('assets/bucket.png'),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: introimg.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                        final item = introimg[index];

                        return Container(
                          height: smallPhone ? 475.h : 550.h,
                          width: largePhone ? 290.w : 275.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.r),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 260.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.r),
                                    topRight: Radius.circular(25.r),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(item['img']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 15.w,
                                  vertical: smallPhone ? 15.h : 50.h,
                                ),
                                child: Text(
                                  item['Description']!,
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),

                              if (index == 3)
                                AnimatedSwitcher( 
                                  duration: Duration(milliseconds: 100),
                                  transitionBuilder:(child, animation) => FadeTransition(opacity: animation, child: child,),
                                  child: 
                                  _currentIndex == 3 ?
                                  SizedBox(
                                    key: ValueKey('Button'),
                                    width: 200.w,
                                    height: smallPhone ? 50.h : 55.h,
                                    child: ElevatedButton(
                                      onPressed: () => context.go('/startscreen'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFF61DE9F,
                                        ),
                                        foregroundColor: Colors.white,
                                        elevation: 0.0,
                                        shadowColor: Colors.transparent,
                                        splashFactory: NoSplash.splashFactory,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5.r,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Get Started',
                                        style: TextStyle(
                                          fontFamily: 'RalewayRegular',
                                          fontSize: 22.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ) 
                                  ) : const SizedBox.shrink(key: ValueKey('Empty'),),
                                ),
                            ],
                          ),
                        );
                      },
                  options: CarouselOptions(
                    height: smallPhone ? 475.h : 550.h,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
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
