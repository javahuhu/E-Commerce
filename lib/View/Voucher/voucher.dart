import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import 'package:dotted_line/dotted_line.dart';

class VoucherScreen extends ConsumerWidget {
  VoucherScreen({super.key});

  final List<IconData> iconItems = [
    Icons.qr_code,
    Icons.bookmark,
    Icons.settings,
  ];

  final selectbutton = StateProvider<int?>((ref) => 1);
  final selectIconItems = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemscon = ref.watch(selectIconItems);
    final selectedbutton = ref.watch(selectbutton);
    final largePhone = MediaQuery.of(context).size.height > 850;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      child: Image(image: AssetImage('assets/testprofile.jpg')),
                    ),
                  ),

                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Voucher',
                        style: TextStyle(
                          fontFamily: 'Raleyway',
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                            ref.read(selectIconItems.notifier).state = index;

                            switch (itemscon) {
                              case 0:
                                context.push('');
                              case 1:
                                context.push('');
                              case 2:
                                context.push('');
                            }
                          },

                          child: Container(
                            height: 35.w,
                            width: 35.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: itemscon == index
                                  ? Color(0xFF9775FA)
                                  : Colors.white,
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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160.w,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(selectbutton.notifier).state = 1;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedbutton == 1
                            ? Color(0xFF9775FA)
                            : Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                      ),
                      child: Text(
                        'Active Rewards',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 160.w,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(selectbutton.notifier).state = 2;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedbutton == 2
                            ? Color(0xFF9775FA)
                            : Colors.white,
                        foregroundColor: Colors.black,

                        elevation: 2,
                      ),
                      child: Text(
                        'Progress',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            selectedbutton == 1
                ? _buildVouchers(context, ref)
                : SizedBox.shrink(),

            selectedbutton == 2
                ? _buildProgress(context, ref)
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

Widget _buildVouchers(BuildContext context, WidgetRef ref) {
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 50.h),
          Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(356.w, 100.h),
                painter: ClippedBorderPainter(
                  clipRadius: 10.0,
                  borderColor:
                      Colors.blueAccent, // Color for the rounded clip borders
                  borderWidth: 3.w,
                ),
              ),
              ClippedVoucher(
                width: 356.w,
                height: 130.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent, width: 2.w),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Voucher',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 18.sp,
                                color: Colors.blueAccent,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF9F9F),
                                borderRadius: BorderRadius.circular(5.r),
                              ),

                              child: Text(
                                'Valid Until 5.16.20',
                                style: TextStyle(
                                  fontFamily: 'RalewayRegular',
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0.3.w),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: Colors.blueAccent,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 20.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shop_2,
                              size: 22.sp,
                              color: Colors.blueAccent,
                            ),

                            SizedBox(width: 10.w),

                            Text(
                              'First Purchase',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Raleway',
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '5% off for your next order',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Transform.translate(
                              offset: Offset(0, 0.h),
                              child: SizedBox(
                                height: 30.h,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                  ),

                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      fontFamily: 'RalewayRegular',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
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

          SizedBox(height: 15.h),
          Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(356.w, 100.h),
                painter: ClippedBorderPainter(
                  clipRadius: 10.0,
                  borderColor:
                      Colors.blueAccent, // Color for the rounded clip borders
                  borderWidth: 3.w,
                ),
              ),
              ClippedVoucher(
                width: 356.w,
                height: 130.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent, width: 2.w),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Voucher',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 18.sp,
                                color: Colors.blueAccent,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF9F9F),
                                borderRadius: BorderRadius.circular(5.r),
                              ),

                              child: Text(
                                'Valid Until 6.20.20',
                                style: TextStyle(
                                  fontFamily: 'RalewayRegular',
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 0.3.w),
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 2.0,
                          dashLength: 4.0,
                          dashColor: Colors.blueAccent,
                          dashGapLength: 4.0,
                          dashGapColor: Colors.transparent,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 20.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.volunteer_activism_sharp,
                              size: 22.sp,
                              color: Colors.blueAccent,
                            ),

                            SizedBox(width: 10.w),

                            Text(
                              'Gift From Customer Care',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontFamily: 'Raleway',
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '15% off your next purchase',
                              style: TextStyle(
                                fontFamily: 'RalewayRegular',
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Transform.translate(
                              offset: Offset(0, 0.h),
                              child: SizedBox(
                                height: 30.h,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                  ),

                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      fontFamily: 'RalewayRegular',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
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

          SizedBox(height: 20.h),
        ],
      ),
    ),
  );
}

Widget _buildProgress(BuildContext context, WidgetRef ref) {
  return Column(
    children: [
      SizedBox(height: 25.h),

      GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 75.w,
                    width: 75.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 4
                        )
                      ]
                    ),
                    child: CircularProgressIndicator(
                      value: 0.7, // 70% progress
                      strokeWidth: 8,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF9775FA),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF9775FA), width: 1.w),
                    ),
                    child: Icon(
                      Icons.heat_pump_rounded,
                      size: 50.sp,
                      color: Color(0xFF9775FA),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Text(
                'First Purchase',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}

class ClippedVoucher extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double clipRadius;

  const ClippedVoucher({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.clipRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: VoucherClipper(clipRadius: clipRadius),
      child: SizedBox(width: width, height: height, child: child),
    );
  }
}

class VoucherClipper extends CustomClipper<Path> {
  final double clipRadius;

  VoucherClipper({required this.clipRadius});

  @override
  Path getClip(Size size) {
    final path = Path();
    final centerY = size.height / 2;

    // Start from top-left corner
    path.moveTo(0, 0);

    // Top edge
    path.lineTo(size.width, 0);

    // Right edge to center clip
    path.lineTo(size.width, centerY - clipRadius);

    // Right center clip (semicircle)
    path.arcToPoint(
      Offset(size.width, centerY + clipRadius),
      radius: Radius.circular(clipRadius),
      clockwise: false,
    );

    // Right edge from center clip to bottom
    path.lineTo(size.width, size.height);

    // Bottom edge
    path.lineTo(0, size.height);

    // Left edge to center clip
    path.lineTo(0, centerY + clipRadius);

    // Left center clip (semicircle)
    path.arcToPoint(
      Offset(0, centerY - clipRadius),
      radius: Radius.circular(clipRadius),
      clockwise: false,
    );

    // Left edge from center clip to top
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClippedBorderPainter extends CustomPainter {
  final double clipRadius;
  final Color borderColor;
  final double borderWidth;

  ClippedBorderPainter({
    required this.clipRadius,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final centerY = size.height / 2;

    // Draw left semicircle border
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, centerY), radius: clipRadius),
      -math.pi / 2, // Start angle (top)
      math.pi, // Sweep angle (semicircle)
      false,
      paint,
    );

    // Draw right semicircle border
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width, centerY), radius: clipRadius),
      math.pi / 2, // Start angle (bottom)
      math.pi, // Sweep angle (semicircle)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
