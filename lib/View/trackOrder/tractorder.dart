import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrder extends ConsumerWidget {
  TrackOrder({super.key});
  final currentstep = StateProvider<int>((ref) => 1);
  final totalstep = StateProvider<int>((ref) => 3);

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
      "update": "Success",
      "Date": 'April,19 12:31',
      "Status": 'Attempt to deliver your parcel was not successful',
      "Details": '',
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largePhone = MediaQuery.of(context).size.height > 850;
    final cstep = ref.watch(currentstep);
    final tstep = ref.watch(totalstep);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(
                children: List.generate(tstep * 2 - 1, (index) {
                  if (index.isEven) {
                    // Circle
                    int stepIndex = index ~/ 2;
                    bool isCompleted = stepIndex <= cstep;

                    return Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? _getStepColor(stepIndex)
                            : Color(0xFFFF0000), // Red
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Line
                    int leftStep = (index - 1) ~/ 2;
                    bool isLineActive = leftStep < cstep;

                    return Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          gradient: isLineActive
                              ? LinearGradient(
                                  colors: [
                                    _getStepColor(leftStep),
                                    _getStepColor(leftStep + 1),
                                  ],
                                )
                              : LinearGradient(
                                  colors: [
                                    Color(0xFF007BFF), // Blue
                                    Color(0xFFFF0000), // Red
                                  ],
                                ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                
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
              height: 450.h,
              child: ListView.separated(
                separatorBuilder: (_, _) => SizedBox(height: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                itemCount: sample.length,
                itemBuilder: (context, index) {
                  final product = sample[index];
                  final showFailed = product['update'] == 'Failed';
                  final showSuccess = product['update'] == 'Success';

                  String displayStatus = product['Status'];
                  if (showSuccess) {
                    displayStatus = 'Delivered';
                  }
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
                              child: (showSuccess || showFailed)
                                  ? GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: 350.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                children: [
                                                  if (showSuccess)
                                                    SuccessBottomSheet(),
                                                  if (showFailed)
                                                    NotSuccessBottomSheet(),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: displayStatus,
                                                    style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontSize: 17.sp,
                                                      color: showFailed
                                                          ? Colors.blueAccent
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  if (showFailed)
                                                    WidgetSpan(
                                                      alignment:
                                                          PlaceholderAlignment
                                                              .middle,
                                                      child: Icon(
                                                        Icons
                                                            .arrow_right_alt_outlined,
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
                                          if (showSuccess)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: 135.w,
                                              ),
                                              child: Container(
                                                height: 20.w,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 13.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    )
                                  : RichText(
                                      text: TextSpan(
                                        text: displayStatus,
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 17.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                            ),

                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: showFailed
                                    ? Colors.red
                                    : showSuccess
                                    ? Colors.green
                                    : const Color.fromARGB(255, 249, 249, 249),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                product['Date'],
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: showFailed
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : showSuccess
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),
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
      ),
    );
  }

  Color _getStepColor(int step) {
    if (step == 0) return Colors.blue;
    if (step == 1) return Colors.blue;
    if (step == 2) return Colors.green;
    return Colors.grey;
  }
}

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          width: double.infinity,
          alignment: Alignment.center,

          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r),
              topLeft: Radius.circular(10.r),
            ),
          ),

          child: Text(
            'Delivery was successful',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 25.sp,
              color: Colors.black,
            ),
          ),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 15.w, top: 15.h),
            child: Text(
              'You want to Review?',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Text(
            "Don't worry, we will shortly contact you to arrange more suitable time for the delivery. You can also contact us by using this number +00 000 000 000 or chat with our customer care service.",
            style: TextStyle(
              fontFamily: 'RalewayRegular',
              fontSize: 13.sp,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 35.h),
        SizedBox(
          height: 45.h,
          width: 335.w,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9775FA),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Review',
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class NotSuccessBottomSheet extends StatelessWidget {
  const NotSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          width: double.infinity,
          alignment: Alignment.center,

          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r),
              topLeft: Radius.circular(10.r),
            ),
          ),

          child: Text(
            'Delivery was not successful',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 25.sp,
              color: Colors.black,
            ),
          ),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 15.w, top: 15.h),
            child: Text(
              'You want to Review?',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Text(
            "Don't worry, we will shortly contact you to arrange more suitable time for the delivery. You can also contact us by using this number +00 000 000 000 or chat with our customer care service.",
            style: TextStyle(
              fontFamily: 'RalewayRegular',
              fontSize: 13.sp,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 35.h),
        SizedBox(
          height: 45.h,
          width: 335.w,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9775FA),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Text(
              'Chat Now',
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
