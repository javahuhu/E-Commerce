import 'package:dotted_separator/dotted_separator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  SettingsScreen({super.key});

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
  final selectpersonalIndex = StateProvider<int>((ref) => 0);
  final selectaccountIndex = StateProvider<int>((ref) => 0);
  final selectshopIndex = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontSize: 30.sp,
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              'Personal',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontSize: 22.sp,
              ),
            ),
          ),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personal.length,
            itemBuilder: (context, index) {
              final item = personal[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(selectpersonalIndex.notifier).state = index;

                      switch (index) {
                        case 0:
                          context.push('/profilesettings');
                          break;
                        case 1:
                          context.push('/shippingaddress');
                          break;
                        case 2:
                          context.push('/paymentmethods');
                          break;
                      }
                    },
                    child: ListTile(
                      leading: Text(
                        item['label'],
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              'Shop',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontSize: 22.sp,
              ),
            ),
          ),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: shop.length,
            itemBuilder: (context, index) {
              final item = shop[index];
              return
              GestureDetector(onTap: () {
                ref.read(selectshopIndex.notifier).state = index;

                switch(index){
                  case 0: context.go('');
                  case 1: context.go('');
                  case 2: context.go('/sizesettings');
                  case 3: context.go('');
                }
              }, child: 
               Column(
                children: [
                  ListTile(
                    leading: Text(
                      item['label'],
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ),
                ],
              ));
            },
          ),

          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              'Account',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Colors.black,
                fontSize: 22.sp,
              ),
            ),
          ),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: account.length,
            itemBuilder: (context, index) {
              final item = account[index];
              return GestureDetector(
                onTap: () {
                  ref.read(selectaccountIndex.notifier).state = index;

                  switch (index) {
                    case 0:
                      context.go('/accountsettings');
                      break;
                    case 1:
                      context.go('');
                  }
                },
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        item['label'],
                        style: TextStyle(
                          fontFamily: 'RalewayRegular',
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item['language'],
                            style: TextStyle(fontSize: 15.sp),
                          ),

                          SizedBox(width: 10.w),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 20.sp,
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
    );
  }
}
