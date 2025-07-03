import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../ViewModel/user_view_model.dart';

class ChangepasswordScreen extends ConsumerWidget {
  ChangepasswordScreen({super.key});


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController changepassword = TextEditingController();
  final TextEditingController confirmchangepassword = TextEditingController();
  final obscureprovider = StateProvider<bool>((ref) => true);
  final obscureproviderconfirm = StateProvider<bool>((ref)=> true);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -160,
            child: CustomPaint(
              size: Size(650.w, 500.h),
              painter: PinkBlobPainter(),
            ),
          ),

          Positioned(
            top: 50.h,
            right: -100.w,
            child: CustomPaint(
              size: Size(300.w, 300.h),
              painter: GreenBlobPainter(),
            ),
          ),



          Form(
            key: formKey,
            child: 
            SingleChildScrollView(child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 145.h),
                SizedBox(
                height: 150.h,
                width: 150.h,
                child: Image.asset('assets/changepassword.webp'),
              ),
               SizedBox(height: 45.h),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 25.w,
                    vertical: 0,
                  ),
                  child: TextFormField(
                    controller: changepassword,
                    obscureText: ref.watch(obscureprovider),
                    style: TextStyle(fontSize: 18.sp),
                    decoration: InputDecoration(
                      labelText: 'Change Password',
                      labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 106, 241, 174),
                        fontSize: 13.sp,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(icon: Icon(ref.watch(obscureprovider) ? Icons.visibility : Icons.visibility_off, size: 22.sp, color: Colors.black,),
                      onPressed: () => ref.read(obscureprovider.notifier).state ^= true,)
                    ),

                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Input Password';
                      }
                      return null;
                    },

                    onChanged: (value) => ref.read(userChangePasswordProvider.notifier).updateChangePassword(value),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 25.w,
                    vertical: 15.h,
                  ),
                  child: TextFormField(
                    controller: confirmchangepassword,
                    obscureText: ref.watch(obscureproviderconfirm),
                    style: TextStyle(fontSize: 18.sp),
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 106, 241, 174),
                        fontSize: 13.sp,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      suffixIcon: IconButton(icon: Icon(ref.watch(obscureproviderconfirm) ? Icons.visibility : Icons.visibility_off, size: 22 .sp, color: Colors.black,),
                      onPressed: () => ref.read(obscureproviderconfirm.notifier).state ^= true,)
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Input Password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 140.h,),
                SizedBox(
                  width: 300.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        context.go('/login');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),)
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
      size.height * 0.4,
      size.width * 0.2,
      size.height * 0,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width * 0.5,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.8,
      size.width * 0.2,
      size.height * 0.5,
    );
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
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.1,
      size.width * 0.2,
      size.height * 0,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width * 0.5,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.8,
      size.width * 0.2,
      size.height * 0.5,
    );
    path.quadraticBezierTo(0, size.height * 0.7, 0, size.height * 0.3);
    path.close();

    // Mirror the path horizontally
    final matrix = Matrix4.identity()
      ..translate(size.width)
      ..scale(-1.0, 1.0); // horizontal flip

    final mirroredPath = path.transform(matrix.storage);

    canvas.drawPath(Path.from(mirroredPath), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
