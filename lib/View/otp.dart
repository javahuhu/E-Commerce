import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),
      body: Stack(
        children: [
          Positioned(
            top: -80.h,
            left: -50.w,
            child: CustomPaint(
              size: Size(650.w, 500.h),
              painter: PinkBlobPainter(),
            ),
          ),

          Positioned(
            top: -100,
            left: -100,
            child: Container(
              height: 350.w,
              width: 350.w,
              decoration: BoxDecoration(
                color: const Color(0xFF61DE9F),
                borderRadius: BorderRadius.circular(250.r),
                border: Border.all(
                  color: const Color.fromARGB(255, 109, 255, 182),
                  width: 5.w,
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200.h),
                Container(
                  height: 100.w,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(500.r),
                    border: Border.all(color: Colors.white, width: 5.w),
                  ),

                  child: 
                  ClipOval(
                  child: Image.asset('assets/testprofile.jpg', fit: BoxFit.cover,),
                )),

                SizedBox(height: 5.h),
                Text(
                  'Hello, Christian',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 22.sp,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 8.h),
                Text(
                  'Enter 4-digits code we sent you',
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'on your Email',
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 8.h),
                Text(
                  'E**her@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 15.h),
                
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true,
                  fieldWidth: 50.w,
                ),

                SizedBox(height: 65.h),
                SizedBox(
                  width: 120.w,
                  height: 35.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF61DE9F),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Send Again',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                
                SizedBox(height: 50.h),
                TextButton(onPressed: () {}, child: 
                Text('Cancel', style: TextStyle(fontFamily: 'RalewayRegular', fontSize: 15.sp, color: Colors.black),))


              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PinkBlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFFF9F9F); // Pink color
    final path = Path();

    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.1,
      size.width * 0.1,
      size.height * 0,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.2,
      size.width * 0.45,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.7,
      size.width * 0.4,
      size.height * 0.8,
    );
    path.quadraticBezierTo(0, size.height * 0.7, 0, size.height * 0.3);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
