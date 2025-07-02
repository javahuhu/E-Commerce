import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginusername = TextEditingController();
  final TextEditingController loginpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),

      body: Stack(
        children: [
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
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 135.w, top: 70.h),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 40.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 250.h),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 25.w,
                              vertical: 0.h,
                            ),
                            child: TextFormField(
                              controller: loginusername,
                              style: TextStyle(fontSize: 18.sp),
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    106,
                                    241,
                                    174,
                                  ),
                                  fontSize: 13.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 25.w,
                              vertical: 15.h,
                            ),
                            child: TextFormField(
                              controller: loginpassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    106,
                                    241,
                                    174,
                                  ),
                                  fontSize: 13.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: TextButton(
                                onPressed: () => context.go('/forgotpassword'),
                                style: TextButton.styleFrom(
                                  elevation: 0.0,
                                  splashFactory: NoSplash.splashFactory,
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    fontSize: 13.sp,
                                    color: const Color.fromARGB(216, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 70.h),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 300.w,
                              height: 40.h,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
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
          ),
        ],
      ),
    );
  }
}
