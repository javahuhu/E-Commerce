import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commercehybrid/Model/selectproduct_model.dart';
import 'package:e_commercehybrid/ViewModel/addtocart_view_model.dart';
import 'package:e_commercehybrid/ViewModel/product_view_model.dart';
import 'package:e_commercehybrid/ViewModel/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commercehybrid/constantsize.dart';

class Chooseitem extends ConsumerWidget {
  @override
  Chooseitem({super.key});

  final currentIndex = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = ref.watch(currentIndex);
    final selectedproduct = ref.watch(selectedproductProvider);
    final cart = ref.watch(addtocartProvider);

    if (selectedproduct == null) {
      return Scaffold(body: Center(child: Text('No item to Show')));
    }
    final inCart = cart.any((product) => product.id == selectedproduct.id);
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
                          itemCount: selectedproduct.image.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                                return Image.asset(
                                  selectedproduct.image[index],
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
                          count: selectedproduct.image.length,
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

                _buildProductDetails(selectedproduct, ref, context),

                SizedBox(height: 100.h),
              ],
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 40.w,
                      child: ElevatedButton(
                        onPressed: () {
                          final product = selectedproduct.toProduct();
                          final isInWishlist = ref.read(
                            wishlistProvider.select(
                              (wishlist) =>
                                  wishlist.any((p) => p.id == product.id),
                            ),
                          );

                          if (isInWishlist) {
                            ref
                                .read(wishlistProvider.notifier)
                                .removetoWishlist(product.id);
                          } else {
                            ref
                                .read(wishlistProvider.notifier)
                                .addtoWishlist(product);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF9F9F9),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final isFavorite = ref.watch(
                              wishlistProvider.select(
                                (wishlist) => wishlist.any(
                                  (p) => p.id == selectedproduct.id,
                                ),
                              ),
                            );
                            return Center(
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 25.sp,
                                color: isFavorite ? Colors.red : Colors.black,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    inCart
                        ? SizedBox(key: ValueKey('empty'))
                        : SizedBox(
                            height: 50.h,
                            width: 130.w,
                            child: ElevatedButton(
                              onPressed: () {
                                final product = selectedproduct.toProduct();
                                ref.read(addtocartProvider).add(product);
                              },
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

                    inCart
                        ? SizedBox(
                            height: 50.h,
                            width: 290.w,
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
                          )
                        : SizedBox(
                            height: 50.h,
                            width: 130.w,
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

final allreviews = StateProvider<bool>((ref) => false);
Widget _buildProductDetails(
  SelectproductModel product,
  WidgetRef ref,
  BuildContext context,
) {
  final popularproduct = ref.watch(popularItemsProvider);
  final youmightlike = ref.watch(youmightlikeProvider);
  final expand = ref.watch(allreviews);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.price,
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
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
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
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Text(
            product.title,
            style: TextStyle(fontSize: 14.sp, color: Colors.black),
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: GestureDetector(
          onTap: () {
            _showBottomModal(product, context, ref);
          },
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
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
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
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
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
                  Icons.arrow_forward_ios_sharp,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: product.subimage.asMap().entries.take(3).map((entry) {
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

      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, top: 20.h),
          child: Text(
            'Specification',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 22.sp,
              color: Colors.black,
            ),
          ),
        ),
      ),

      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, top: 10.h),
          child: Text(
            'Material',
            style: TextStyle(
              fontFamily: 'RalewayRegular',
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),

      SizedBox(height: 3.h),

      SizedBox(
        height: 25.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 22.w),
          separatorBuilder: (_, _) => SizedBox(width: 15.w),
          itemCount: product.material.length,
          itemBuilder: (context, index) {
            return Container(
              height: 30.h,
              width: 55.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFFE5EBFC),
                borderRadius: BorderRadius.circular(3.r),
              ),

              child: Text(
                product.material[index],
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            );
          },
        ),
      ),

      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, top: 10.h),
          child: Text(
            'Origin',
            style: TextStyle(
              fontFamily: 'RalewayRegular',
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),

      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, top: 3.h),
          child: Container(
            height: 25.h,
            width: 50.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFE5EBFC),
              borderRadius: BorderRadius.circular(3.r),
            ),

            child: Text(
              product.origin,
              style: TextStyle(fontSize: 15.sp, color: Colors.black),
            ),
          ),
        ),
      ),

      SizedBox(height: 5.h),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size Guide',
              style: TextStyle(
                fontFamily: 'RalewayRegular',
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),

            GestureDetector(
              onTap: () {},

              child: Container(
                height: 35.w,
                width: 35.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF9775FA),
                ),

                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),

      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 22.w),
          child: Text(
            'Delivery',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 22.sp,
              color: Colors.black,
            ),
          ),
        ),
      ),

      SizedBox(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 5.h),
        child: Container(
          height: 37.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: 2.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Standard',
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),

                SizedBox(width: 20.w),

                Container(
                  height: 20.h,
                  width: 70.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5EBFC),
                    borderRadius: BorderRadius.circular(3.r),
                  ),

                  child: Text(
                    '5 - 7 Days',
                    style: TextStyle(
                      fontFamily: 'RalewayRegular',
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(width: 35.w),

                Text(
                  '\$3.00',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Container(
          height: 37.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: 2.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Express',
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),

                SizedBox(width: 30.w),

                Container(
                  height: 20.h,
                  width: 70.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5EBFC),
                    borderRadius: BorderRadius.circular(3.r),
                  ),

                  child: Text(
                    '5 - 7 Days',
                    style: TextStyle(
                      fontFamily: 'RalewayRegular',
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(width: 35.w),

                Text(
                  '\$3.00',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, top: 15.h),
          child: Text(
            'Rating and Reviews',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 22.sp,
              color: Colors.black,
            ),
          ),
        ),
      ),

      SizedBox(height: 10.h),
      Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 22.w),
              child: SizedBox(
                height: 25.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(5, (index) {
                    return SizedBox(
                      height: 50.h,
                      width: 30.w,
                      child: Icon(Icons.star_border, size: 30.sp),
                    );
                  }),
                ),
              ),
            ),
          ),

          SizedBox(width: 10.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFE5EBFC),
              borderRadius: BorderRadius.circular(3.r),
            ),

            child: Text(
              '4/100',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),

      SizedBox(height: 15.h),

      Container(
        height: expand ? null : 150.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 0.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3.w),
                        boxShadow: [
                          BoxShadow(color: Colors.black38, blurRadius: 8),
                        ],
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(
                          'assets/testprofile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Veronica',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(5, (index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 0.w),
                                  child: Icon(Icons.star),
                                );
                              }),
                            ),

                            SizedBox(height: 5.h),

                            Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: SizedBox(
                                width: 245.w,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (expand)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3.w),
                          boxShadow: [
                            BoxShadow(color: Colors.black38, blurRadius: 8),
                          ],
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/testprofile.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Veronica',
                                style: TextStyle(
                                  fontFamily: 'RalewayRegular',
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 0.w),
                                    child: Icon(Icons.star),
                                  );
                                }),
                              ),

                              SizedBox(height: 5.h),

                              Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: SizedBox(
                                  width: 245.w,
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),

      SizedBox(
        height: 60.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
          child: ElevatedButton(
            onPressed: () {
              ref.read(allreviews.notifier).state = !ref
                  .read(allreviews.notifier)
                  .state;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9775FA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10.r),
              ),
            ),
            child: Text(
              expand ? 'Show less' : 'View All Reviews',
              style: TextStyle(
                fontFamily: 'RalewayRegular',
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most Popular',
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
                color: Color(0xFF9775FA),
                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 18.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),

      SizedBox(
        height: 192.h,
        child: ListView.separated(
          separatorBuilder: (_, _) => SizedBox(width: 15.w),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 22.sp),
          itemCount: popularproduct.length,
          itemBuilder: (context, index) {
            final popular = popularproduct[index];
            final desc = popularproduct[index];
            final event = popularproduct[index];
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  width: 100.w,
                  margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
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
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            Icon(
                              Icons.favorite,
                              size: 15.sp,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10.6.w),

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
              ],
            );
          },
        ),
      ),

      SizedBox(height: 15.h),

      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 22.w),
          child: Text(
            'You Might Like',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 22.sp,
              color: Colors.black,
            ),
          ),
        ),
      ),

      SizedBox(height: 15.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.sp),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: _responsiveGrid(context),
          ),
          itemCount: youmightlike.length,
          itemBuilder: (BuildContext context, index) {
            final mightlike = youmightlike[index];
            return GestureDetector(
              onTap: () {
                ref
                    .read(selectedproductProvider.notifier)
                    .state = SelectproductModel(
                  id: mightlike.id,
                  image: mightlike.image,
                  subimage: mightlike.subimage,
                  title: mightlike.title,
                  price: mightlike.price,
                  material: mightlike.material,
                  origin: mightlike.origin,
                  size: mightlike.size,
                  color: mightlike.color,
                );
                context.push('/chooseproduct');
              },

              child: Column(
                children: [
                  Container(
                    height: 130.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),

                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Image.asset(
                          mightlike.image[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 5.w),
                    child: Text(
                      mightlike.title,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w, top: 5.h),
                      child: Text(
                        mightlike.price,
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
            );
          },
        ),
      ),
    ],
  );
}

final selectIndex = StateProvider<int?>((ref) => null);

void _showBottomModal(
  SelectproductModel product,
  BuildContext context,
  WidgetRef ref,
) {
  final smallphone = MediaQuery.of(context).size.height < 700;
  final cart = ref.watch(addtocartProvider);
  final inCart = cart.any((p) => p.id == product.id);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          return SingleChildScrollView(
            child: Container(
              height: smallphone ? 525.h : 500.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),

              child: Column(
                children: [
                  Container(
                    height: 100.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: Row(
                        children: [
                          Container(
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: AssetImage(product.subimage[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                product.price,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 25.sp,
                                  color: Colors.black,
                                ),
                              ),

                              SizedBox(height: 5.h),

                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 0.h,
                                    ),
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

                                  SizedBox(width: 10.w),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 0.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE5EBFC),
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),

                                    child: Text(
                                      'L',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.w, top: 15.h),
                      child: Text(
                        'Color Options',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  SizedBox(
                    height: 79.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      separatorBuilder: (_, _) => SizedBox(width: 15.w),
                      itemCount: product.subimage.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            final current = ref.read(selectIndex);
                            ref.read(selectIndex.notifier).state =
                                current == index ? null : index;
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.r),
                                child: Image.asset(
                                  product.subimage[index],
                                  height: 79.h,
                                  width: 90.w,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Positioned(
                                top: 50.h,
                                left: 5.w,
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 200),
                                  transitionBuilder: (child, animation) =>
                                      ScaleTransition(
                                        scale: animation,
                                        child: child,
                                      ),
                                  child: ref.watch(selectIndex) == index
                                      ? Container(
                                          key: ValueKey('Check'),
                                          height: 25.w,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFF9F9F),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 3.w,
                                            ),
                                          ),

                                          child: Icon(
                                            Icons.check,
                                            size: 15.sp,
                                            color: Colors.white,
                                          ),
                                        )
                                      : SizedBox(
                                          key: ValueKey('Empty'),
                                          width: 24.w,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22.w, top: 15.h),
                      child: Text(
                        'Size',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  SizedBox(
                    height: 25.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        shrinkWrap: true,
                        separatorBuilder: (_, _) => SizedBox(width: 15.w),
                        itemCount: product.size.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE5EBFC),
                              borderRadius: BorderRadius.circular(3.r),
                            ),

                            child: Text(
                              product.size[index],
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Quantity',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18.sp,
                          ),
                        ),

                        SizedBox(width: 70.w),

                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/minusbtn.png'),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 4.h,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFE5EBFC),
                            borderRadius: BorderRadius.circular(5.r),
                          ),

                          child: Text(
                            '5',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40.w,
                            width: 40.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/addbtn.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: smallphone ? 25.h : 20.h),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.w,
                        vertical: 23.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: 40.w,
                            child: ElevatedButton(
                              onPressed: () {
                                final currentproduct = product.toProduct();
                                final wishlist = ref.read(
                                  wishlistProvider.notifier,
                                );
                                if (wishlist.inWishlist(currentproduct.id)) {
                                  wishlist.removetoWishlist(currentproduct.id);
                                } else {
                                  wishlist.addtoWishlist(currentproduct);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF9F9F9),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Consumer(
                                // This makes the icon update instantly
                                builder: (context, ref, child) {
                                  final isFavorite = ref.watch(
                                    wishlistProvider.select(
                                      (wishlist) => wishlist.any(
                                        (p) => p.id == product.id,
                                      ),
                                    ),
                                  );
                                  return Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 25.sp,
                                    color: isFavorite
                                        ? Colors.red
                                        : Colors.black,
                                  );
                                },
                              ),
                            ),
                          ),

                          inCart
                              ? SizedBox(key: ValueKey('empty'))
                              : SizedBox(
                                  height: smallphone ? 50.h : 55.h,
                                  width: 130.w,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF9775FA),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
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

                          inCart
                              ? SizedBox(
                                  height: 50.h,
                                  width: 290.w,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF9F9F),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
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
                                )
                              : SizedBox(
                                  height: smallphone ? 50.h : 55.h,
                                  width: 130.w,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFF9F9F),
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
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
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

double _responsiveGrid(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  if (height < Breakpoints.extraSmall) return 0.8;
  if (height < Breakpoints.smallPhone) return 0.71;
  if (height < Breakpoints.xxsmall) return 0.71;
  if (height < Breakpoints.largePhone) return 0.75;
  if (height < Breakpoints.xxLarge) return 0.7;
  if (height < Breakpoints.max) return 0.75;
  return 60.h;
}
