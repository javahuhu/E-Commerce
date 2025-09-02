import 'package:dotted_separator/dotted_separator.dart';
import 'package:e_commercehybrid/Model/user_card_model.dart';
import 'package:e_commercehybrid/ViewModel/usercard_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodScreen extends ConsumerWidget {
  PaymentMethodScreen({super.key});

  final List<Map<String, dynamic>> dummy = [{}];

  final selectcard = StateProvider<int?>((ref) => 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addedcards = ref.watch(userCardProvider);
    final hasCards = addedcards.isNotEmpty;
    final selected = ref.watch(selectcard);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
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
                    'Payment Methods',
                    style: TextStyle(
                      fontFamily: 'RalewayRegular',
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              if (hasCards)
                SizedBox(
                  height: 155.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    physics: addedcards.length <= 1
                        ? NeverScrollableScrollPhysics()
                        : BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: addedcards.length + 1,
                    separatorBuilder: (_, _) => SizedBox(width: 10.w),
                    itemBuilder: (context, index) {
                      if (index == addedcards.length) {
                        return GestureDetector(
                          onTap: () {
                            _showBottomAddAnotherCard(context, ref);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 170.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Color(0xFF9775FA),
                              borderRadius: BorderRadius.circular(10.r),
                            ),

                            child: Icon(
                              Icons.add,
                              size: 25.sp,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }

                      final cards = addedcards[index];
                      final ifSelected = selected == index;
                      return GestureDetector(
                        onTap: () {
                          ref.read(selectcard.notifier).state = index;
                        },
                        child: Container(
                          width: 280.w,
                          padding: EdgeInsets.symmetric(
                            vertical: 5.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4FE),
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: ifSelected
                                  ? Colors.blueAccent
                                  : Colors.transparent,
                              width: 2.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/mastercard.png',
                                      fit: BoxFit.cover,
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      _showBottomEditCard(context, ref, index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFE5EBFC),
                                      ),

                                      child: Icon(
                                        Icons.settings,
                                        size: 22.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10.h),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cards.cardnumber.isNotEmpty
                                        ? "**** **** ****"
                                        : "",
                                    style: TextStyle(
                                      fontFamily: 'RalewayRegular',
                                      fontSize: 30.sp,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                    ),
                                  ),

                                  Transform.translate(
                                    offset: Offset(0, -10),
                                    child: Text(
                                      cards.cvv,
                                      style: TextStyle(
                                        fontFamily: 'RalewayRegular',
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cards.cardholder,
                                    style: TextStyle(
                                      fontFamily: 'RalewayRegular',
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),
                                  ),

                                  Text(
                                    cards.expiredate,
                                    style: TextStyle(
                                      fontFamily: 'RalewayRegular',
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

              if (hasCards)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dummy.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4FE),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.shopping_bag,
                              size: 25.sp,
                              color: Colors.blueAccent,
                            ),

                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'April,19 2020 12:31',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
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

                            trailing:  Text(
                                  '-\$14,00',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),

          Positioned(
            bottom: 25.h,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
                      .animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                      ),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: hasCards
                  ? SizedBox.shrink(key: ValueKey('empty'))
                  : _showBottomCard(ref),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _showBottomCard(WidgetRef ref) {
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 450.h,
      width: 350.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 1),
        ],
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFF),
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
                  'Add Card',
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
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: Text(
              'Card Holder',
              style: TextStyle(fontSize: 15.sp, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: TextField(
              controller: cardHolderController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 16.w,
                ),
                filled: true,
                fillColor: const Color(0xFFF8FAFF),
                hintText: 'Required',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: Text(
              'Card Number',
              style: TextStyle(fontSize: 15.sp, color: Colors.black),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: TextField(
              controller: cardNumberController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 16.w,
                ),
                filled: true,
                fillColor: const Color(0xFFF8FAFF),
                hintText: 'Required',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 10.h),
                        child: Text(
                          'Valid',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      TextField(
                        controller: expiryController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF8FAFF),
                          hintText: 'Required',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 10.h),
                        child: Text(
                          'CVV',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      TextField(
                        controller: cvvController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF8FAFF),
                          hintText: 'Required',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: SizedBox(
              height: 45.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(userCardProvider.notifier)
                      .addCard(
                        UserCard(
                          cardholder: cardHolderController.text,
                          cardnumber: cardNumberController.text,
                          expiredate: expiryController.text,
                          cvv: cvvController.text,
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF9775FA),
                ),
                child: Text('Save', style: TextStyle(fontSize: 15.sp)),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void _showBottomAddAnotherCard(BuildContext context, WidgetRef ref) {
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          return Container(
            height: 505.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8FAFF),
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
                        'Add Card',
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
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  child: Text(
                    'Card Holder',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 5.h,
                  ),
                  child: TextField(
                    controller: cardHolderController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFF),
                      hintText: 'Required',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  child: Text(
                    'Card Number',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 5.h,
                  ),
                  child: TextField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFF),
                      hintText: 'Required',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text(
                                'Valid',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            TextField(
                              controller: expiryController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 16.w,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8FAFF),
                                hintText: 'Required',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text(
                                'CVV',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            TextField(
                              controller: cvvController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 16.w,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8FAFF),
                                hintText: 'Required',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: SizedBox(
                    height: 45.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(userCardProvider.notifier)
                            .addCard(
                              UserCard(
                                cardholder: cardHolderController.text,
                                cardnumber: cardNumberController.text,
                                expiredate: expiryController.text,
                                cvv: cvvController.text,
                              ),
                            );

                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF9775FA),
                      ),
                      child: Text('Save', style: TextStyle(fontSize: 15.sp)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void _showBottomEditCard(BuildContext context, WidgetRef ref, int index) {
  final TextEditingController editcardHolderController =
      TextEditingController();
  final TextEditingController editcardNumberController =
      TextEditingController();
  final TextEditingController editexpiryController = TextEditingController();
  final TextEditingController editcvvController = TextEditingController();
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          return Container(
            height: 505.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8FAFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Edit Card',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 22.sp,
                            color: Colors.black,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            ref
                                .read(userCardProvider.notifier)
                                .removeCard(index);
                            context.pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Colors.black12,
                                ),
                              ],
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              Icons.delete_outline_sharp,
                              size: 20.sp,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  child: Text(
                    'Card Holder',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 5.h,
                  ),
                  child: TextField(
                    controller: editcardHolderController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFF),
                      hintText: 'Required',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                  child: Text(
                    'Card Number',
                    style: TextStyle(fontSize: 15.sp, color: Colors.black),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 5.h,
                  ),
                  child: TextField(
                    controller: editcardNumberController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 16.w,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFF),
                      hintText: 'Required',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text(
                                'Valid',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            TextField(
                              controller: editexpiryController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 16.w,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8FAFF),
                                hintText: 'Required',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Text(
                                'CVV',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            TextField(
                              controller: editcvvController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 16.w,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8FAFF),
                                hintText: 'Required',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: SizedBox(
                    height: 45.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final changecard = UserCard(
                          cardholder: editcardHolderController.text,
                          cardnumber: editcardNumberController.text,
                          expiredate: editexpiryController.text,
                          cvv: editcvvController.text,
                        );

                        ref
                            .read(userCardProvider.notifier)
                            .thecardupdated(changecard, index);

                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF9775FA),
                      ),
                      child: Text('Save', style: TextStyle(fontSize: 15.sp)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
