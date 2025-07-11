import 'package:e_commercehybrid/ViewModel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../ViewModel/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginScreen extends ConsumerWidget{
   LoginScreen({super.key});


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginusername = TextEditingController();
  final TextEditingController loginpassword = TextEditingController();
  final obscureprovider = StateProvider<bool>((ref) => true);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final smallPhone = MediaQuery.of(context).size.height < 700;
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),

      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              height: 350.w,
              width: 350.w,
              decoration: BoxDecoration(
                color: const Color(0xFF61DE9F),
                borderRadius: BorderRadius.circular(250.r),
                border: Border.all(
                  color: const Color.fromARGB(255, 109, 255, 182),
                  width: 5.w,
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 145.w, top: 70.h),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 40.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: smallPhone ? 200.h : 250.h),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 25.w,
                              vertical: 0.h,
                            ),
                            child: TextFormField(
                              controller: loginusername,
                              style: TextStyle(fontSize: 18.sp),
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    106,
                                    241,
                                    174,
                                  ),
                                  fontSize: 13.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),

                              onChanged: (value) => ref.read(userLoginProvider.notifier).updateLoginUsername(value),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 25.w,
                              vertical: 15.h,
                            ),
                            child: TextFormField(
                              obscureText: ref.watch(obscureprovider),
                              controller: loginpassword,
                              style: TextStyle(fontSize: 18.sp),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    106,
                                    241,
                                    174,
                                  ),
                                  fontSize: 13.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                                suffixIcon: IconButton(
                                icon: Icon(ref.watch(obscureprovider)? Icons.visibility : Icons.visibility_off, size: 22.sp, color: Colors.black,),
                                onPressed: () => ref.read(obscureprovider.notifier).state ^= true)
                              ),

                              

                              onChanged: (value) => ref.read(userLoginProvider.notifier).updateLoginPassword(value),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: TextButton(
                                onPressed: () => context.go('/forgotpassword'),
                                style: ButtonStyle(
                                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                                  shadowColor: WidgetStatePropertyAll(Colors.transparent),
                                  elevation: WidgetStatePropertyAll(0)
                                ),
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    fontSize: 13.sp,
                                    color: const Color.fromARGB(216, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 50.h),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 300.w,
                              height: 50.h,
                              child: ElevatedButton(
                                onPressed: () async {
                                 final loginUsername = ref.watch(userLoginProvider).username;
                                 final loginPassword = ref.watch(userLoginProvider).password;

                                 loginAccount(context, loginUsername, loginPassword);

                                 if(formKey.currentState!.validate()) {
                                  
                                 }

                                 
                                },
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontFamily: 'RalewayRegular',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: smallPhone ? 0.h : 30.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
