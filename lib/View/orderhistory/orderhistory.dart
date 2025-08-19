import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistory extends ConsumerWidget {
  OrderHistory({super.key});

  final List<IconData> iconItems = [
    Icons.qr_code,
    Icons.bookmark,
    Icons.settings,
  ];

  final List<Map<String, dynamic>> sample = [
    {
      "img": 'assets/sampleitem.jpeg',
      "Date": 'April,19',
      "Details": 'Lorem ipsum dolor sit amet consectetur.',
      "orderno": "Order #92287157",
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "Date": 'April,19',
      "Details": 'Lorem ipsum dolor sit amet consectetur.',
      "orderno": "Order #92287157",
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "Date": 'April,19',
      "Details": 'Lorem ipsum dolor sit amet consectetur.',
      "orderno": "Order #92287157",
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "Date": 'April,19',
      "Details": 'Lorem ipsum dolor sit amet consectetur.',
      "orderno": "Order #92287157",
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "Date": 'April,19',
      "Details": 'Lorem ipsum dolor sit amet consectetur.',
      "orderno": "Order #92287157",
    },

    {
      "img": 'assets/sampleitem.jpeg',
      "Date": 'April,19',
      "Details": 'Lorem ipsum dolor sit amet consectetur.',
      "orderno": "Order #92287157",
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largePhone = MediaQuery.of(context).size.height > 850;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 5.h,
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
                        'History',
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
                      children: iconItems.map((iconItems) {
                        return GestureDetector(
                          onTap: () {},

                          child: Container(
                            height: 35.w,
                            width: 35.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 235, 234, 234),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Icon(iconItems),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sample.length,
              separatorBuilder: (_, _) => SizedBox(height: 15.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              itemBuilder: (context, index) {
                final item = sample[index];
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 10.w,
                  ),

                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 109.h,
                            width: 129.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(blurRadius: 2, color: Colors.black12),
                              ],
                            ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                item['img'],

                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: 160.w,
                              child: Text(
                                item['Details'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),

                            SizedBox(height: 10.h),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                item['orderno'],
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.h,
                                    horizontal: 17.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF9F9F9),
                                    borderRadius: BorderRadius.circular(7.r),
                                  ),

                                  child: Text(
                                    item['Date'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {
                                    _showReviewBottomModal(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    minimumSize: Size(77.w, 32.h),
                                    side: BorderSide(
                                      color: Colors.blueAccent,
                                      width: 1.w,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Review',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showReviewBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        height: 460.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Review',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 22.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(
                      'assets/sampleitem.jpeg',
                      fit: BoxFit.cover,
                      height: 50.w,
                      width: 50.w,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur.',
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                      Text(
                        'Order #92287157',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Row(
                children: List.generate(
                  5,
                  (index) => IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {},
                    icon: Icon(
                      Icons.star_border_sharp,
                      color: Colors.amber,
                      size: 45.sp,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: TextField(
                  scrollPhysics: AlwaysScrollableScrollPhysics(),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: 'Comment',
                    filled: true,
                    fillColor: Color(0xFFF1F4FE),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 15.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9775FA),
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)
                  )
                ),
                child: Text(
                  'Say it!',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
