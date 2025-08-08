import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToRecievedScreen extends ConsumerWidget {
  const ToRecievedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<IconData> iconItems = [
      Icons.qr_code,
      Icons.bookmark,
      Icons.settings,
    ];

    final orderProvider = StateProvider<List<Map<String, dynamic>>>(
      (ref) => [
        {
          'orderno': 'Order 92287157',
          'type': 'Standard Delivery',
          'items': 3,
          'status': 'Packed',
          'intoStatus': 'Review',
          'images': [
            {"img": 'assets/sampleitem2.jpeg'},
            {"img": 'assets/sampleitem3.jpeg'},
            {"img": 'assets/sampleitem4.jpg'},
            {"img": 'assets/sampleitem5.jpg'},
          ],
        },
        {
          'orderno': 'Order 92287158',
          'type': 'Standard Delivery',
          'items': 3,
          'status': 'Packed',
          'intoStatus': 'Track',
          'images': [
            {"img": 'assets/sampleitem2.jpeg'},
            {"img": 'assets/sampleitem3.jpeg'},
            {"img": 'assets/sampleitem4.jpg'},
          ],
        },

        {
          'orderno': 'Order 92287157',
          'type': 'Standard Delivery',
          'items': 3,
          'status': 'Packed',
          'intoStatus': 'Review',
          'images': [
            {"img": 'assets/sampleitem2.jpeg'},
            {"img": 'assets/sampleitem3.jpeg'},
            {"img": 'assets/sampleitem4.jpg'},
            {"img": 'assets/sampleitem5.jpg'},
          ],
        },
        {
          'orderno': 'Order 92287158',
          'type': 'Standard Delivery',
          'items': 3,
          'status': 'Packed',
          'intoStatus': 'Track',
          'images': [
            {"img": 'assets/sampleitem2.jpeg'},
            {"img": 'assets/sampleitem3.jpeg'},
            {"img": 'assets/sampleitem4.jpg'},
          ],
        },

        {
          'orderno': 'Order 92287157',
          'type': 'Standard Delivery',
          'items': 3,
          'status': 'Packed',
          'intoStatus': 'Track',
          'images': [
            {"img": 'assets/sampleitem2.jpeg'},
            {"img": 'assets/sampleitem3.jpeg'},
            {"img": 'assets/sampleitem4.jpg'},
            {"img": 'assets/sampleitem5.jpg'},
          ],
        },
        {
          'orderno': 'Order 92287158',
          'type': 'Standard Delivery',
          'items': 3,
          'status': 'Packed',
          'intoStatus': 'Review',
          'images': [
            {"img": 'assets/sampleitem2.jpeg'},
            {"img": 'assets/sampleitem3.jpeg'},
            {"img": 'assets/sampleitem4.jpg'},
          ],
        },
      ],
    );

    final largePhone = MediaQuery.of(context).size.height > 850;
    final sampleimg = ref.watch(orderProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 175.h, // The height of the wave
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 170.h, // The height of the wave
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9775FA), Color(0xFF9775FA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          Column(
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
                        child: Image(
                          image: AssetImage('assets/testprofile.jpg'),
                        ),
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
                          'My Orders',
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

              SizedBox(height: 12.h),

              Expanded(
                child: ListView.builder(
                  itemCount: sampleimg.length,

                  itemBuilder: (context, index) {
                    final order = sampleimg[index];
                    final group = order['images'];
                    final whatstatus = order['intoStatus'] == 'Review';

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.w,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 3.r,
                                ),
                              ],
                            ),

                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                  ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: group.length,
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    group[index]['img']!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Transform.translate(
                              offset: Offset(0, 0),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order['orderno'],
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Text(
                                      order['type'],
                                      style: TextStyle(
                                        fontFamily: 'RalewayRegular',
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                      ),
                                    ),

                                    SizedBox(height: 30.h),

                                    Text(
                                      order['status'],
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 50.w,
                                padding: EdgeInsets.all(5.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9F9F9),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Text(
                                  order['items'].toString(),
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              SizedBox(height: 30.h),

                              SizedBox(
                                height: 30.h,
                                width: 99.w,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: whatstatus
                                        ? Colors.white
                                        : Colors.blueAccent,
                                    backgroundColor: whatstatus
                                        ? Colors.blueAccent
                                        : Colors.white,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      side: BorderSide(
                                        color: whatstatus
                                            ? Colors.transparent
                                            : Colors.blueAccent,
                                      ),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: Text(order['intoStatus']),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.8);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height * 0.85);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.7);
    var secondEndPoint = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
