import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commercehybrid/ViewModel/recommendation_view_model..dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Chooseitem extends ConsumerWidget {
  @override
  Chooseitem({super.key});

  final currentIndex = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = ref.watch(selectedimageProvider);
    final selectedsubimage = ref.watch(selectedsubimageProvider);
    final activeIndex = ref.watch(currentIndex);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 380.h,
                        width: double.infinity,
                        child: CarouselSlider.builder(
                          itemCount: selectedImage.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                                return Image.asset(
                                  selectedImage[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              },
                          options: CarouselOptions(
                            height: 380.h,
                            scrollDirection: Axis.horizontal,
                            autoPlay: false,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            onPageChanged: (index, reason) {
                              ref.read(currentIndex.notifier).state = index;
                            },
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 350.h),
                        child: AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: selectedImage.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 10.w,
                            dotWidth: 10.w,
                            activeDotColor: Color(0xFF9775FA),
                            dotColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$17.00',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 22.sp,
                          color: Colors.black,
                        ),
                      ),

                      Container(
                        height: 35.w,
                        width: 35.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 247, 246, 246),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ],
                        ),

                        child: Image.asset(
                          'assets/share.png',
                          height: 30.h,
                          width: 30.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 5.h,
                  ),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Variations',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 22.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5.w),

                      Container(
                        height: 25.h,
                        width: 50.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFE5EBFC),
                          borderRadius: BorderRadius.circular(3.r),
                        ),

                        child: Text(
                          'Pink',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Container(
                        height: 25.h,
                        width: 50.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFE5EBFC),
                          borderRadius: BorderRadius.circular(3.r),
                        ),

                        child: Text(
                          'M',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      SizedBox(width: 45.w),

                      Container(
                        height: 35.w,
                        width: 35.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF9775FA),
                        ),

                        child: Icon(
                          Icons.arrow_forward_sharp,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: selectedsubimage.asMap().entries.take(3).map((
                      entry,
                    ) {
                      var sub = entry.value;
                      return GestureDetector(
                        onTap: () {},

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Container(
                            height: 75.h,
                            width: 85.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: Image.asset(sub, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 40.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF9F9F9),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_outline,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 35.h,
                      width: 120.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9775FA),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 35.h,
                      width: 120.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9F9F),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
