import 'package:e_commercehybrid/Model/issues_mode.dart';
import 'package:e_commercehybrid/ViewModel/issue_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final isOpen = StateProvider<bool>((ref) => true);

class ChatBot extends ConsumerWidget {
  ChatBot({super.key});

  final selectmainissue = StateProvider<IssuesModel?>((ref) => null);
  final selectsubissue = StateProvider<IssuesModel?>((ref) => null);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isopenissue = ref.watch(isOpen);
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 135.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 111.h,
                      width: 221.w,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EBFC),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        'Hello, Amanda! Welcome to Customer Care Service. We will be happy to help you. Please, provide us more details about your issue before we can start.',
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),


            Padding(
                  padding: EdgeInsets.only(top: 657.h),
                  child: Container(
                    height: 100.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xFFE5EBFC)),

                    child: isopenissue
                        ? SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Message",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9775FA),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.photo,
                                    size: 30.sp,
                                    color: Color(0xFF9775FA),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.book_sharp,
                                    size: 27.sp,
                                    color: Color(0xFF9775FA),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),


          

          Container(
            height: 125.h,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
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

          AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset(0, 0),
                ).animate(animation),
                child: child,
              );
            },
            child: isopenissue
                ? _buildIssues(context, ref)
                : GestureDetector(
                    onTap: () {
                      ref.read(isOpen.notifier).state = true;
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 125.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20.sp,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
          ),


          
        ],
      ),
    );
  }
}

final selectmainissue = StateProvider<IssuesModel?>((ref) => null);
final selectsubissue = StateProvider<String?>((ref) => null);
final selectundersubissue = StateProvider<String?>((ref) => null);
final issueStep = StateProvider<int>((ref) => 0);
Widget _buildIssues(BuildContext context, WidgetRef ref) {
  return Consumer(
    builder: (context, ref, child) {
      final selectedmainissue = ref.watch(selectmainissue);
      final selectedsubissue = ref.watch(selectsubissue);
      final selectedundersub = ref.watch(selectundersubissue);
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
                            currentstep == 0
                                ? "What's your issues"
                                : currentstep == 1
                                ? selectedmainissue?.issue ?? "Select Sub Issue"
                                : currentstep == 2
                                ? selectedsubissue ?? "Select Under Sub Issues"
                                : "",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 21.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 700),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0, 2),
                              end: Offset(0, 0),
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },

                      child: currentstep == 0
                          ? Align(
                              key: ValueKey('mainIssue'),
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
                                          : const Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                      labelStyle: TextStyle(
                                        color: alreadyselectedmain
                                            ? Colors.white
                                            : Color(0xFF9775FA),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        side: BorderSide(
                                          color: alreadyselectedmain
                                              ? Colors.transparent
                                              : Color(0xFF9775FA),
                                        ),
                                      ),
                                      selected: alreadyselectedmain,

                                      onSelected: (_) {
                                        ref
                                                .read(selectmainissue.notifier)
                                                .state =
                                            item;
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          : currentstep == 1 && selectedmainissue != null
                          ? Align(
                              key: ValueKey('subIssue'),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 8.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: selectedmainissue.subissue.keys.map(
                                    (subissue) {
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
                                            : const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                        labelStyle: TextStyle(
                                          color: alreadyselectedsub
                                              ? Colors.white
                                              : Color(0xFF9775FA),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          side: BorderSide(
                                            color: alreadyselectedsub
                                                ? Colors.transparent
                                                : Color(0xFF9775FA),
                                          ),
                                        ),
                                        selected: alreadyselectedsub,

                                        onSelected: (_) {
                                          ref
                                                  .read(selectsubissue.notifier)
                                                  .state =
                                              subissue;
                                        },
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            )
                          : currentstep == 2 && selectedsubissue != null
                          ? Align(
                              key: ValueKey('undersubIssue'),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 8.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      (selectedmainissue
                                                  ?.subissue[selectedsubissue] ??
                                              [])
                                          .map((underissue) {
                                            final alreadyselectunder =
                                                selectedundersub == underissue;
                                            return ChoiceChip(
                                              label: Text(underissue),
                                              selectedColor: Color(0xFF9775FA),
                                              showCheckmark: false,
                                              avatar: alreadyselectunder
                                                  ? Container(
                                                      padding: EdgeInsets.all(
                                                        2.0,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding: EdgeInsets.all(
                                                          0.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                              color: Color(
                                                                0xFF9775FA,
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                        child: Icon(
                                                          Icons.check,
                                                          color: Colors.white,
                                                          size: 15.sp,
                                                        ),
                                                      ),
                                                    )
                                                  : null,
                                              backgroundColor:
                                                  alreadyselectunder
                                                  ? Color(0xFF9775FA)
                                                  : const Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255,
                                                    ),
                                              labelStyle: TextStyle(
                                                color: alreadyselectunder
                                                    ? Colors.white
                                                    : Color(0xFF9775FA),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                side: BorderSide(
                                                  color: alreadyselectunder
                                                      ? Colors.transparent
                                                      : Color(0xFF9775FA),
                                                ),
                                              ),
                                              selected: alreadyselectunder,

                                              onSelected: (_) {
                                                ref
                                                        .read(
                                                          selectundersubissue
                                                              .notifier,
                                                        )
                                                        .state =
                                                    underissue;
                                              },
                                            );
                                          })
                                          .toList(),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ),

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

                              if (currentstep == 1 &&
                                  selectedsubissue != null) {
                                ref.read(issueStep.notifier).state = 2;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF9775FA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              minimumSize: Size(270.w, 45.h),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 35.h,
                            width: 40.w,
                            child: ElevatedButton(
                              onPressed: () {
                                ref.read(issueStep.notifier).state = 0;

                                if (currentstep == 0) {
                                  ref.read(isOpen.notifier).state = false;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF9775FA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 15.sp,
                              ),
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
