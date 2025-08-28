import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSettings extends ConsumerWidget {
  ProfileSettings({super.key});

  final List<Map<String, dynamic>> personal = [
    {"label": "Profile"},
    {"label": "Shipping Address"},
    {"label": "Payment methods"},
  ];

  final List<Map<String, dynamic>> shop = [
    {"label": "Country"},
    {"label": "Currency"},
    {"label": "Sizes"},
    {"label": "Terms and Conditions"},
  ];

  final List<Map<String, dynamic>> account = [
    {"label": "Language", "language": 'English'},
    {"label": "About Slada", "language": ""},
  ];

  final openobsecure = StateProvider<bool>((ref) => true);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obsecure = ref.watch(openobsecure);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                  'Your Profile',
                  style: TextStyle(
                    fontFamily: 'RalewayRegular',
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 10.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            spreadRadius: 1,
                          ),
                        ],
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500.r),
                        child: Image.asset(
                          'assets/testprofile.jpg',
                          fit: BoxFit.cover,
                          height: 80.w,
                          width: 80.w,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                spreadRadius: 1,
                              ),
                            ],
                          ),

                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF9775FA),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FE),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                    ),
                  ),

                  SizedBox(height: 5.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FE),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextField(
                    obscureText: obsecure,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FE),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          ref.read(openobsecure.notifier).state = !obsecure;
                        },
                        icon: Icon(
                          obsecure ? Icons.visibility_off : Icons.visibility,
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

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF9775FA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            minimumSize: Size(double.infinity, 45.h),
          ),
          child: Text('Save Changes', style: TextStyle(fontSize: 15.sp)),
        ),
      ),
    );
  }
}
