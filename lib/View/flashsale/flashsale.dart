import 'package:e_commercehybrid/Model/selectproduct_model.dart';
import 'package:e_commercehybrid/ViewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FlashSale extends ConsumerWidget {
  FlashSale({super.key});
  final isSelected = StateProvider<int>((ref) => 2);
  final List<String> discount = ["All", "10%", "20%", "30%", "40%", "50%"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(isSelected);
    final showvalue = discount[selectedIndex];
    final flashsale = ref.watch(flashsaleProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -150.h,
              left: 125.w,
              child: CustomPaint(
                size: Size(400.w, 400.h),
                painter: BlobPainter(),
              ),
            ),

            Positioned(
              top: -250.h,
              left: 200.w,
              child: Container(
                height: 400.w,
                width: 400.w,
                decoration: BoxDecoration(
                  color: Color(0xFF9775FA),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Column(
              children: [
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.translate(
                        offset: Offset(0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flash Sale',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 22.sp,
                                color: Colors.black,
                              ),
                            ),

                            Text(
                              'Choose Your Discount',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
                                height: 30.h,
                                width: 30.w,
                                margin: EdgeInsets.only(left: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF3F3F3),
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  '69',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 18.sp,
                                    color: Colors.black,
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

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 25.h,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 3),
                          ],
                        ),
                      ),

                      Positioned(
                        top: -7.5.h,
                        child: Row(
                          children: List.generate(discount.length, (index) {
                            final sale = discount[index];
                            final select = selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
                                ref.read(isSelected.notifier).state = index;
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                height: 45.h,
                                margin: EdgeInsets.only(left: 6.w),
                                alignment: Alignment.center,
                                decoration: select
                                    ? BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          30.r,
                                        ),
                                        border: Border.all(
                                          color: Colors.blueAccent,
                                          width: 2,
                                        ),
                                      )
                                    : BoxDecoration(),

                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      sale,
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 15.sp,
                                        color: select
                                            ? Colors.blueAccent
                                            : Colors.black,
                                        fontWeight: select
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),

                                    select
                                        ? Positioned(
                                            left: sale == "All" ? 5.w : 10.w,
                                            bottom: 20.h,
                                            child: CustomPaint(
                                              size: Size(12.w, 12.h),
                                              painter: TrianglePainter(),
                                            ),
                                          )
                                        : SizedBox(key: ValueKey('empty')),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 0.h,
                  ),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.w,
                      ),
                    ),

                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'A R T I C A L E   R E I M A G I N E D',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 88.5.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/sampleitem5.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' $showvalue Discount',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list_rounded,
                          size: 33.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: flashsale.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      final sale = flashsale[index];
                      return GestureDetector(
                        onTap: () {
                          ref.read(selectedproductProvider.notifier).state = SelectproductModel(
                            id: sale.id, 
                            image: sale.image, 
                            subimage: sale.subimage, 
                            title: sale.title, 
                            price: sale.price, 
                            material: sale.material, 
                            origin: sale.origin, 
                            size: sale.size, 
                            color: sale.color);
                            context.go('/chooseproduct');
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 180.h,
                                  width: 160.w,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.h,
                                    horizontal: 5.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      sale.image[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 30.w,
                                    top: 5.h,
                                  ),
                                  child: SizedBox(
                                    width: 130.w,
                                    child: Text(
                                      sale.title,
                                      style: TextStyle(
                                        fontFamily: 'RalewayRegular',
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),

                                Row(
                                  children: [
                                    Text(
                                      sale.price,
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                      ),
                                    ),

                                    SizedBox(width: 10.w),
                                    Text(
                                      sale.discount.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: const Color(0xFFFF9F9F),
                                        fontSize: 15.sp,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2,
                                        decorationColor: const Color(
                                          0xFFFF9F9F,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Positioned(
                              left: 115.w,
                              top: 5.h,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade50
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start top center
    path.moveTo(size.width * 0.5, 0);

    // Top-right curve
    path.quadraticBezierTo(
      size.width * 1.0,
      size.height * 0.2,
      size.width * 0.9,
      size.height * 0.55,
    );

    // Bottom-right curve
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.95,
      size.width * 0.45,
      size.height * 0.9,
    );

    // ⬅ Bottom-left "wavey cut"
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.6,
      size.width * 0.0,
      size.height * 0.5,
    );

    // Left curve going up
    path.quadraticBezierTo(
      size.width * 0.0,
      size.height * 0.2,
      size.width * 0.45,
      0,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;

    final path = Path();
    path.moveTo(0, 0); // top-left
    path.lineTo(size.width, 0); // top-right
    path.lineTo(size.width / 2, size.height); // bottom-middle (point)
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
