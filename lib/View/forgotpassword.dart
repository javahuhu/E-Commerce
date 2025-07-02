import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotpasswordScreen extends ConsumerWidget {
  ForgotpasswordScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final forgotemail = StateProvider<String>((ref) => '');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

          Positioned(
            top: 400.h,
            right: -80.w,

            child: SizedBox(
              height: 350.h,
              width: 300.w,
              child: Image.asset('assets/email.webp'),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 10.h),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 40.sp,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Forgot'),
                      WidgetSpan(
                        child: SizedBox(width: 100.w, height: 100.w),
                      ),
                      TextSpan(text: 'Password'),
                    ],
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
                            vertical: 0,
                          ),
                          child: TextFormField(
                            onChanged: (value) => ref.read(forgotemail.notifier).state = value,
                            style: TextStyle(fontSize: 18.sp),
                            decoration: InputDecoration(
                              labelText: 'Email',
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
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input your email';
                              }

                              return null;
                            },
                          ),
                        ),

                        SizedBox(height: 170.h),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 300.w,
                            height: 40.h,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.go('/otp');
                                }
                              },
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
                                'Next',
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
        ],
      ),
    );
  }
}
