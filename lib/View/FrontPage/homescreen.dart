import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   final smallphone = MediaQuery.of(context).size.height < 700;
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:smallphone ? 40.h : 80.h),

                SizedBox(
                  height: 180.h,
                  width: 180.w,
                  child: Image.asset('assets/shoppingbags.png'),
                ),

                SizedBox(height: 10.h),

                Text(
                  'Laza',
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 52.sp),
                ),

                Text(
                  'Beautiful eCommerce UI Kit',
                  style: TextStyle(fontSize: 15.sp),
                ),

                Text(
                  'for your online store',
                  style: TextStyle(fontSize: 15.sp),
                ),

                SizedBox(height: smallphone ? 40.h : 90.h),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  width: 325.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),

                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      Text(
                        'Look Good, Feel Good',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Create your individual & unique style',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 13.sp,
                          color: const Color.fromARGB(255, 131, 131, 131),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'and look amazing everyday.',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 13.sp,
                          color: const Color.fromARGB(255, 131, 131, 131),
                        ),
                      ),

                      SizedBox(height: 25.h),

                      SizedBox(
                        height: 50.h,
                        width: 280.w,
                        child: ElevatedButton(
                          onPressed: () => context.go('/createaccount'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Text(
                            "Let's Get Started",
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5.h),
                            TextButton(
                              onPressed: () => context.go('/login'),

                              style: ButtonStyle(
                                shadowColor: WidgetStatePropertyAll(
                                  Colors.transparent,
                                ),
                                overlayColor: WidgetStatePropertyAll(
                                  Colors.transparent,
                                ),
                                elevation: WidgetStatePropertyAll(0),
                              ),

                              child: Text(
                                'I already have an account',
                                style: TextStyle(
                                  fontFamily: 'RalewayRegular',
                                  fontSize: 13.sp,
                                  color: const Color.fromARGB(255, 87, 87, 87),
                                ),
                              ),
                            ),

                            SizedBox(width: 17.h),

                            Center(
                              child: Container(
                                height: 25.h,
                                width: 25.h,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100.r),
                                ),

                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
