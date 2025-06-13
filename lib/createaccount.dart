import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateaccountScreen extends StatefulWidget {
  const CreateaccountScreen ({super.key});

  @override
  State<CreateaccountScreen> createState() => _CreateaccountScreenState();
}

class _CreateaccountScreenState extends State<CreateaccountScreen> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),

      body: 
      Stack(
      children: [
      
      Positioned(
      top: -100.h,
      left: -100.w,
      child: CustomPaint(
      size:  Size(650.w, 500.h),
      painter: PinkBlobPainter(),
      ),),

      Positioned(
        bottom: 225.h,
        right: -125.w,
        child: CustomPaint(
        size:  Size(300.w, 300.h),
        painter: GreenBlobPainter(),
      )),
      
      Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 50.w),
          child: RichText(text: TextSpan(style: TextStyle(fontFamily: 'Raleway', fontSize:40.sp),
          children: [
            TextSpan(text: 'Create'),
            WidgetSpan(child: SizedBox(width: 100.w, height: 100.h,)),
            TextSpan(text: 'Account'),
            
          ]
          )))
          
        ],
      ),
   ],) );
  }

}

class PinkBlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFFF9F9F); // Pink color
    final path = Path();

    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.1, size.width * 0.1, size.height * 0);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.2, size.width * 0.45, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.7, size.width * 0.4, size.height * 0.8);
    path.quadraticBezierTo(0, size.height * 0.7, 0, size.height * 0.3);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class GreenBlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF61DE9F); // Green color
    final path = Path();

   // Start at the left middle
    path.moveTo(size.width * 0.2, size.height * 0.5);
    
    // Create the organic blob shape using bezier curves
    path.quadraticBezierTo(
      size.width * 0.4, size.height * 0.2,
      size.width * 0.3, size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.7, size.height * 0.05,
      size.width * 0.8, size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.9, size.height * 0.6,
      size.width * 0.7, size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.9, size.height * 0.95,
      size.width * 0.3, size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.1, size.height * 0.7,
      size.width * 0.2, size.height * 0.5,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

