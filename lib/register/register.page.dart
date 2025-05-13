import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/constant/myColors.dart';
import 'package:shopping_app/login/login.page.dart';
import 'package:shopping_app/register/service/registerController.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool isRegister = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Text(
                  "Sign Up",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp,
                    color: Color.fromARGB(255, 16, 27, 1),
                  ),
                ),
                SizedBox(height: 40.h),
                RegisterBody(
                  title: "Name",
                  hinttext: "Enter Your Name",
                  controller: nameController,
                  type: TextInputType.name,
                ),
                SizedBox(height: 20.h),
                // RegisterBody(
                //   title: "Email",
                //   hinttext: "Enter Your Email",
                //   controller: emailController,
                //   type: TextInputType.emailAddress,
                // ),
                Text(
                  "Email ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: Color.fromARGB(255, 16, 27, 1),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
                    hintText: "Enter Your Email",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 153, 153, 153),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                    ).hasMatch(value)) {
                      return "Please Enter Valid Email Address";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                RegisterBody(
                  title: "Password",
                  hinttext: "Enter Your Password",
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Phone ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: Color.fromARGB(255, 16, 27, 1),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
                    hintText: "Enter Your Phone Number",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 153, 153, 153),
                    ),
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 2.w,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number is required';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 46.h),
                    backgroundColor: textColor,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        setState(() {
                          isRegister = true;
                        });

                        await RegisterController.register(
                          context: context,
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                        );
                      } catch (e) {
                        setState(() {
                          isRegister = false;
                        });
                        log(e.toString());
                      }
                    }
                  },
                  child:
                      isRegister
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                            "Sign In",
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Color.fromARGB(255, 16, 27, 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterBody extends StatefulWidget {
  final String title;

  final String hinttext;
  final TextEditingController controller;
  final TextInputType type;
  const RegisterBody({
    super.key,
    required this.title,

    required this.hinttext,
    required this.controller,
    required this.type,
  });

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            color: Color.fromARGB(255, 16, 27, 1),
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          keyboardType: widget.type,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
            hintText: widget.hinttext,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: Color.fromARGB(255, 153, 153, 153),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Color.fromARGB(25, 0, 0, 0),
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Color.fromARGB(25, 0, 0, 0),
                width: 2.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Color.fromARGB(25, 0, 0, 0),
                width: 2.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: Color.fromARGB(25, 0, 0, 0),
                width: 2.w,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget.title} is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
