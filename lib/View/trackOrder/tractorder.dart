import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrder extends ConsumerWidget {
  TrackOrder({super.key});

  final List<IconData> iconItems = [
    Icons.qr_code,
    Icons.bookmark,
    Icons.settings,
  ];

  final List<Map<String, dynamic>> sample = [
    {
      "Status": 'Packed',
      "Date": 'April,19 12:31',
      "Details":
          'Your parcel is packed and will be handed over to our delivery partner.',
    },

    {
      "Status": 'to Logistic Facility',
      "Date": 'April,19 16:20',
      "Details":
          'Your parcel is packed and will be handed over to our delivery partner.',
    },

    {
      "Status": 'Arrived at Logistic Facility',
      "Date": 'April,19 19:07',
      "Details":
          'Your parcel is packed and will be handed over to our delivery partner.',
    },

    {
      "Status": 'Shipped',
      "Date": 'April,19 12:31',
      "Details":
          'Your parcel is packed and will be handed over to our delivery partner.',
    },

    {
      "Status": 'Out for Delivery',
      "Date": 'April,19 12:31',
      "Details":
          'Your parcel is packed and will be handed over to our delivery partner.',
    },

    {
      "update": "Failed",
      "Date": 'April,19 12:31',
      "Status": 'Attempt to deliver your parcel was not successful',
      "Details": '',
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largePhone = MediaQuery.of(context).size.height > 850;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 25.h,
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
                      'To Recieve',
                      style: TextStyle(
                        fontFamily: 'Raleyway',
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Track Your Order',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 15.sp,
                        color: Colors.black,
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

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Container(
              height: 60.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(10.r),
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tracking Number',
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      ClipRRect(
                        child: Image.asset(
                          'assets/trackorder.jpg',
                          height: 18.h,
                          width: 18.w,
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'LGS-i92927839300763731',
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 40.h),

          SizedBox(
            height: 500.h,
            child: ListView.separated(
              separatorBuilder: (_, _) => SizedBox(height: 5.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              itemCount: sample.length,
              itemBuilder: (context, index) {
                final product = sample[index];
                final showFailed = product['update'] == 'Failed';
                return Container(
                  height: 85.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        product['Status'] 
                                        , // space before arrow
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 17.sp,
                                      color: showFailed
                                          ? Colors.blueAccent
                                          : Colors.black,
                                    ),
                                  ),
                                  if(showFailed)
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      Icons.arrow_right_alt_outlined,
                                      size: 25.sp,
                                      color: showFailed
                                          ? Colors.blueAccent
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              softWrap: true,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: showFailed
                                  ? Colors.red
                                  : const Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              product['Date'],
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: showFailed
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h,),
                      Text(
                        product['Details'],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
