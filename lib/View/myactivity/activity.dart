import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyActivity extends ConsumerWidget {
  MyActivity({super.key});

  final List<IconData> iconItems = [
    Icons.qr_code,
    Icons.bookmark,
    Icons.settings,
  ];

  final List<Map<String, dynamic>> shopping = [
    {'value': '12', 'update': 'Ordered'},
    {'value': '7', 'update': 'Recieved'},
    {'value': '5', 'update': 'To Recieved'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final largePhone = MediaQuery.of(context).size.height > 850;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                      'My Activity',
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

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
            child: Container(
              height: 40.h,
              width: 335,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Text(
                'April',
                style: TextStyle(fontSize: 18.sp, color: Color(0xFF9775FA)),
              ),
            ),
          ),

          SizedBox(height: 0.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Expanded(
                  child: SizedBox(
                    height: 30.w,
                    width: 30.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9775FA),
                        padding: EdgeInsets.zero,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chevron_left,
                          size: 22.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Container(
                  height: 350.h,
                  width: 300.w,
                  padding: EdgeInsets.all(5),
                  child: SfCircularChart(
                    legend: Legend(
                      isVisible: true,
                      position: LegendPosition.bottom,
                      overflowMode: LegendItemOverflowMode.wrap,
                      legendItemBuilder:
                          (
                            String name,
                            dynamic series,
                            dynamic point,
                            int index,
                          ) {
                            return SizedBox(
                              width: 65.w,
                              child: Container(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 65.w,
                                      height: 33.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100.r,
                                        ),
                                        color: Colors.blueAccent,
                                      ),

                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                    ),
                    series: <CircularSeries>[
                      DoughnutSeries<ChartData, String>(
                        dataSource: getChartData(),
                        xValueMapper: (ChartData data, _) => data.category,
                        yValueMapper: (ChartData data, _) => data.value,
                        pointColorMapper: (ChartData data, _) => data.color,

                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                          textStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),

                        innerRadius: '43%',
                        radius: '80%',

                        strokeColor: Colors.white,
                        strokeWidth: 2,

                        explodeAll: false,
                        explodeOffset: '5%',
                      ),
                    ],

                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                          height: 67.w,
                          width: 67.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '100%',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Expanded(
                  child: SizedBox(
                    height: 30.w,
                    width: 30.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9775FA),
                        padding: EdgeInsets.zero,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chevron_right,
                          size: 22.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 150.h,

            child: Center(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: shopping.length,
                shrinkWrap: true,

                separatorBuilder: (_, _) => SizedBox(width: 25.w),
                itemBuilder: (context, index) {
                  final status = shopping[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80.w,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 1,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(10.0),
                          child: Container(
                            height: 50.w,
                            width: 50.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueAccent,
                            ),
                            child: Text(
                              status['value'],
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 21.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15.h),

                      Text(
                        status['update'],
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 13.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: ElevatedButton(
              onPressed: () {
                context.go('/orderhistory');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9775FA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 115.w,
                  vertical: 15.h,
                ),
              ),
              child: Text(
                'Order History',
                style: TextStyle(
                  fontFamily: 'RalewayRegular',
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<ChartData> getChartData() {
  return [
    ChartData('Clothing', 25, Color(0xFF1E3A8A)), // Dark blue
    ChartData('Lingerie', 20, Color(0xFF3B82F6)), // Medium blue
    ChartData('Shoes', 15, Color(0xFF60A5FA)), // Light blue
    ChartData('Bags', 15, Color(0xFF93C5FD)), // Very light blue
    ChartData('T-Shirts', 10, Color(0xFF87CEEB)), // Sky blue
    ChartData('Shorts', 15, Color(0xFF8B4513)), // Brown
  ];
}

class ChartData {
  ChartData(this.category, this.value, this.color);
  final String category;
  final double value;
  final Color color;
}
