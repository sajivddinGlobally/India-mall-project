import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/constant/myColors..dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 1;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              GestureDetector(
                // onTap: () {
                //   Navigator.pop(context);
                // },
                child: Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: Color.fromARGB(25, 0, 0, 0),
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 16, 27, 1),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Your Cart",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 16, 27, 1),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      color: Color.fromARGB(25, 0, 0, 0),
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border,
                      color: Color.fromARGB(255, 16, 27, 1),
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deliver at",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    Text(
                      "121 Jump Street, California, 302016",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 75.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Color.fromARGB(25, 150, 28, 130),
                  ),
                  child: Center(
                    child: Text(
                      "Update",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 26.h),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Image.asset("assets/detailslip.png"),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              "Happy Birthday Decoration",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 16, 27, 1),
                              ),
                            ),
                            Text(
                              "Men’s collection",
                              style: GoogleFonts.inter(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                            Text(
                              "\$140.00",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.h),
                              width: 100.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(25, 150, 28, 130),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  GestureDetector(
                                    onTap: () {
                                      decrement();
                                    },
                                    child: Text(
                                      "-",
                                      style: GoogleFonts.inter(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${count.toString()}",
                                    style: GoogleFonts.inter(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      increment();
                                    },
                                    child: Text(
                                      "+",
                                      style: GoogleFonts.inter(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                ],
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
        ],
      ),
    );
  }
}
