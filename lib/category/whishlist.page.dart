import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/constant/myColors..dart';
import 'package:shopping_app/home/home.page.dart';

class WhishlistPage extends StatefulWidget {
  const WhishlistPage({super.key});

  @override
  State<WhishlistPage> createState() => _WhishlistPageState();
}

class _WhishlistPageState extends State<WhishlistPage> {
  List<Map<String, String>> whishList = [
    {"imageUrl": "assets/lipistic.png"},
    {"imageUrl": "assets/makup.png"},
    {"imageUrl": "assets/makup1.png"},
    {"imageUrl": "assets/makep2.png"},
    {"imageUrl": "assets/makup3.png"},
    {"imageUrl": "assets/makup4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                  "Wishlist ",
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
                    width: 66.w,
                    height: 27.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Color.fromARGB(25, 150, 28, 130),
                      border: Border.all(
                        color: Color.fromARGB(255, 150, 28, 130),
                        width: 1.w,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Clear All",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 150, 28, 130),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: whishList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          // "assets/lipistic.png",
                          whishList[index]['imageUrl'].toString(),
                          width: 195.w,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: textColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                                Text(
                                  "4.5",

                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "(512 reviews)",

                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 159.w,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "5 in 1 Lipstick Red Edition & Nud",

                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "\$450.00",

                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: Color.fromARGB(255, 150, 28, 130),
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Move to Cart",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                                color: Color.fromARGB(255, 150, 28, 130),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
