import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Shippingaddress extends ConsumerWidget {
  Shippingaddress({super.key});

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.black,
                  fontSize: 30.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Shipping Address',
                style: TextStyle(
                  fontFamily: 'RalewayRegular',
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Province',
                style: TextStyle(
                  fontFamily: 'RalewayRegular',
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose your Province',
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  height: 30.w,
                  width: 30.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF9775FA),
                  ),

                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      'Address',
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 5.h),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Required',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FE),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Input Address";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 15.h),

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      'Town / City',
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 5.h),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Required',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FE),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Input Town / City";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15.h),

                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      'Postcode',
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 5.h),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Required',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FE),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Postcode";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 5.h),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Required',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FE),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone Number";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formkey.currentState!.validate()) {}
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: Color(0xFF9775FA),
          ),
          child: Text(
            'Save',
            style: TextStyle(fontSize: 15.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
