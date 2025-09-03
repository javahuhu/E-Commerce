import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizesettings extends ConsumerWidget {
  Sizesettings({super.key});

  final checkIndex = StateProvider<int>((ref) => -1);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(checkIndex);
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
                'Sizes',
                style: TextStyle(
                  fontFamily: 'RalewayRegular',
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Container(
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: ListTile(
                leading: Text(
                  'US',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
                trailing: selected == 0
                    ? Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF9775FA),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.check,
                          size: 15.sp,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        Icons.circle_outlined,
                        size: 20.sp,
                        color: Colors.grey.shade500,
                      ),

                onTap: () {
                  ref.read(checkIndex.notifier).state = 0;
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Container(
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: ListTile(
                leading: Text(
                  'EU',
                  style: TextStyle(fontSize: 15.sp, color: Colors.black),
                ),
                trailing: selected == 1
                    ? Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF9775FA),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.check,
                          size: 15.sp,
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        Icons.circle_outlined,
                        size: 20.sp,
                        color: Colors.grey.shade500,
                      ),

                onTap: () {
                  ref.read(checkIndex.notifier).state = 1;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
