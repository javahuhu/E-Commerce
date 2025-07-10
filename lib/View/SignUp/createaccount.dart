import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ViewModel/user_view_model.dart';
import '../../ViewModel/register_view_model.dart';

class CreateaccountScreen extends ConsumerWidget {
  CreateaccountScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController createusername = TextEditingController();
  final TextEditingController createpassword = TextEditingController();
  final TextEditingController createemail = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFF9775FA),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: -100.h,
            left: -60.w,
            child: CustomPaint(
              size: Size(650.w, 500.h),
              painter: PinkBlobPainter(),
            ),
          ),

          Positioned(
            top: 100.h,
            right: -125.w,
            child: CustomPaint(
              size: Size(300.w, 300.h),
              painter: GreenBlobPainter(),
            ),
          ),

       
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50.w),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 40.sp,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Create'),
                      WidgetSpan(
                        child: SizedBox(width: 100.w, height: 100.h),
                      ),
                      TextSpan(text: 'Account'),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 200.h),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 25.w,
                            vertical: 0.h,
                          ),
                          child: TextFormField(
                            controller: createusername,
                            inputFormatters: [
                              TextInputFormatter.withFunction((
                                oldValue,
                                newValue,
                              ) {
                                if (newValue.text.isNotEmpty) {
                                  return TextEditingValue(
                                    text:
                                        newValue.text[0].toUpperCase() +
                                        newValue.text
                                            .substring(1)
                                            .toLowerCase(),
                                    selection: newValue.selection,
                                  );
                                }

                                return newValue;
                              }),

                              FilteringTextInputFormatter.deny(
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                              ),
                            ],
                            style: TextStyle(fontSize: 18.sp),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              
                              labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 106, 241, 174),
                                fontSize: 13.sp,
                                
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),

                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Input a username";
                              }

                              if (value.length < 6) {
                                return "Username must not less than 6 characters";
                              }
                              return null;
                            },

                            onChanged: (value) => ref
                                .read(userProvider.notifier)
                                .updateUsername(value),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 25.w,
                            vertical: 0.h,
                          ),
                          child: TextFormField(
                            controller: createemail,
                            style: TextStyle(fontSize: 18.sp),
                            decoration: InputDecoration(
                              labelText: "Email",
                              
                              labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 106, 241, 174),
                                fontSize: 13.sp,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),

                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Input Email";
                              }

                              if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              ).hasMatch(value)) {
                                return "Enter valid email e.g. example@gmail.com";
                              }

                              return null;
                            },

                            onChanged: (value) => ref
                                .read(userProvider.notifier)
                                .updateEmail(value),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 25.w,
                            vertical: 0.h,
                          ),
                          child: TextFormField(
                            controller: createpassword,
                            style: TextStyle(fontSize: 18.sp),
                            decoration: InputDecoration(
                              labelText: "Password",
                              
                              labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 106, 241, 174),
                                fontSize: 13.sp,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),

                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Input Password";
                              }

                              if (value.length < 8) {
                                return "Input must be 8 or more than";
                              }

                              return null;
                            },

                            onChanged: (value) => ref
                                .read(userProvider.notifier)
                                .updatePassword(value),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 25.w,
                            vertical: 0,
                          ),
                          child: TextFormField(
                            controller: confirmpassword,
                            style: TextStyle(fontSize: 18.sp),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              
                              labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 106, 241, 174),
                                fontSize: 13.sp,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),

                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Input your Password again";
                              }

                              if (value != createpassword.text) {
                                return "Password not Match!";
                              }

                              return null;
                            },

                            onChanged: (value) => ref
                                .read(userProvider.notifier)
                                .updateConfirmpassword(value),
                          ),
                        ),

                        SizedBox(height: 30.h),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 300.w,
                            height: 55.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final createEmail = ref.watch(userProvider).email;
                                  final createPassword = ref
                                      .watch(userProvider)
                                      .password;
                                  final createUsername = ref
                                      .watch(userProvider)
                                      .username;

                                  await registerAccount(
                                    context,
                                    createEmail,
                                    createPassword,
                                    createUsername,
                                  );
                                }
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontFamily: 'RalewayRegular',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ),
                
              ),
            ],
          ),
        ],
      ),
      
    );
  }
}

class PinkBlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFFF9F9F); // Pink color
    final path = Path();

    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.1,
      size.width * 0.1,
      size.height * 0,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.2,
      size.width * 0.4,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.7,
      size.width * 0.3,
      size.height * 0.7,
    );
    path.quadraticBezierTo(0, size.height * 0.7, 0, size.height * 0.3);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class GreenBlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF61DE9F); // Green color
    final path = Path();

    // Start at the left middle
    path.moveTo(size.width * 0.2, size.height * 0.5);

    // Create the organic blob shape using bezier curves
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.2,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.05,
      size.width * 0.8,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.6,
      size.width * 0.7,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.95,
      size.width * 0.3,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.7,
      size.width * 0.2,
      size.height * 0.5,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
