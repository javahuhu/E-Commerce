import 'package:e_commercehybrid/Model/issues_mode.dart';
import 'package:e_commercehybrid/ViewModel/issue_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBot extends ConsumerWidget {
  ChatBot({super.key});

  final selectmainissue = StateProvider<IssuesModel?>((ref) => null);
  final selectsubissue = StateProvider<IssuesModel?>((ref) => null);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 125.h,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      margin: EdgeInsets.only(left: 15.w, top: 30.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple.shade100,
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/boticon.png',
                            height: 40.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Transform.translate(
                      offset: Offset(15.w, 13.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chat Bot',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20.sp,
                              color: Color(0xFF9775FA),
                            ),
                          ),

                          Text(
                            'Customer Care Service',
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 535.h),
                child: Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xFFE5EBFC)),
                ),
              ),
            ],
          ),

          _buildIssues(context, ref),
        ],
      ),
    );
  }
}

final selectmainissue = StateProvider<IssuesModel?>((ref) => null);
final selectsubissue = StateProvider<String?>((ref) => null);
final issueStep = StateProvider<int>((ref) => 0);
Widget _buildIssues(BuildContext context, WidgetRef ref) {
  return Consumer(
    builder: (context, ref, child) {
      final selectedmainissue = ref.watch(selectmainissue);
      final selectedsubissue = ref.watch(selectsubissue);
      final issue = ref.watch(chatIssueProvider);
      final currentstep = ref.watch(issueStep);
      return Stack(
        children: [
          Positioned(
            top: 350.h,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 380.h,
                width: 350.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),

                child: Column(
                  children: [
                    Container(
                      height: 70.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EBFC),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),

                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Text(
                            currentstep == 0 ? "What's your issues" : selectedmainissue?.issue ?? "",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 21.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    if (currentstep == 0) ...[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: issue.map((item) {
                              final alreadyselectedmain =
                                  selectedmainissue?.issue == item.issue;

                              return ChoiceChip(
                                label: Text(item.issue),
                                selectedColor: Color(0xFF9775FA),
                                showCheckmark: false,
                                avatar: alreadyselectedmain
                                    ? Container(
                                        padding: EdgeInsets.all(2.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(0.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF9775FA),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 15.sp,
                                          ),
                                        ),
                                      )
                                    : null,
                                backgroundColor: alreadyselectedmain
                                    ? Color(0xFF9775FA)
                                    : const Color.fromARGB(255, 255, 255, 255),
                                labelStyle: TextStyle(
                                  color: alreadyselectedmain
                                      ? Colors.white
                                      : Color(0xFF9775FA),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(
                                    color: alreadyselectedmain
                                        ? Colors.transparent
                                        : Color(0xFF9775FA),
                                  ),
                                ),
                                selected: alreadyselectedmain,

                                onSelected: (_) {
                                  ref.read(selectmainissue.notifier).state =
                                      item;
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ] else if (currentstep == 1 &&
                        selectedmainissue != null) ...[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: selectedmainissue.subissue.map((
                              subissue,
                            ) {
                              final alreadyselectedsub =
                                  selectedsubissue == subissue;
                              return ChoiceChip(
                                label: Text(subissue),
                                selectedColor: Color(0xFF9775FA),
                                showCheckmark: false,
                                avatar: alreadyselectedsub
                                    ? Container(
                                        padding: EdgeInsets.all(2.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(0.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF9775FA),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 15.sp,
                                          ),
                                        ),
                                      )
                                    : null,
                                backgroundColor: alreadyselectedsub
                                    ? Color(0xFF9775FA)
                                    : const Color.fromARGB(255, 255, 255, 255),
                                labelStyle: TextStyle(
                                  color: alreadyselectedsub
                                      ? Colors.white
                                      : Color(0xFF9775FA),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(
                                    color: alreadyselectedsub
                                        ? Colors.transparent
                                        : Color(0xFF9775FA),
                                  ),
                                ),
                                selected: alreadyselectedsub,

                                onSelected: (_) {
                                  ref.read(selectsubissue.notifier).state =
                                      subissue;
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (currentstep == 0 &&
                                  selectedmainissue != null) {
                                ref.read(issueStep.notifier).state = 1;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF9775FA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              minimumSize: Size(250.w, 45.h),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () {
                              ref.read(issueStep.notifier).state = 0;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF9775FA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              minimumSize: Size(0.w, 45.h),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 17.sp,
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
        ],
      );
    },
  );
}
