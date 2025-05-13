import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/category/service/categoryController.dart';
import 'package:shopping_app/constant/myColors.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  List<Map<String, String>> categoryList = [
    {"imageUrl": "assets/glass.png"},
    {"imageUrl": "assets/red.png"},
    {"imageUrl": "assets/makup.png"},
    {"imageUrl": "assets/makup4.png"},
    {"imageUrl": "assets/box.png"},
    {"imageUrl": "assets/ed.png"},
    {"imageUrl": "assets/box1.png"},
    {"imageUrl": "assets/cream.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = ref.watch(categoryController);
    return Scaffold(
      backgroundColor: defaultColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                // GestureDetector(
                //   child: Container(
                //     width: 44.w,
                //     height: 44.h,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Color.fromARGB(255, 255, 255, 255),
                //       border: Border.all(
                //         color: Color.fromARGB(25, 0, 0, 0),
                //         width: 1.w,
                //       ),
                //     ),
                //     child: Center(
                //       child: Padding(
                //         padding: EdgeInsets.only(left: 8.w),
                //         child: Icon(
                //           Icons.arrow_back_ios,
                //           color: Color.fromARGB(255, 16, 27, 1),
                //           size: 20.sp,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(width: 8.w),
                Text(
                  "Categories ",
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
            SizedBox(height: 16.h),
            Divider(color: Color.fromARGB(25, 0, 0, 0)),
            categoryProvider.when(
              data: (categor) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 113.w,
                          height: 110.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(0, 150, 28, 130),
                                Color.fromARGB(102, 150, 28, 130),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/homekitchen.png",
                                width: 50.w,
                                height: 50.h,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                textAlign: TextAlign.center,
                                "Home &\nKitchen",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 113.w,
                          height: 110.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(child: Image.asset("assets/tik.png")),
                              SizedBox(height: 6.h),
                              Text(
                                textAlign: TextAlign.center,
                                "Beauty &\n Personal Care",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 113.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(25, 0, 0, 0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 113.w,
                          height: 110.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset("assets/homekitchen.png"),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                textAlign: TextAlign.center,
                                "Toy &\n Games",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 113.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(25, 0, 0, 0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          width: 113.w,
                          height: 110.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset("assets/homekitchen.png"),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                textAlign: TextAlign.center,
                                "Kids\n accessories",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 700.h,
                      width: 2.w,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(25, 0, 0, 0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 10.w,
                        left: 10.w,
                        bottom: 10.h,
                      ),
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        width: 300.w,
                        // color: Colors.amber,
                        child: GridView.builder(
                          padding: EdgeInsets.zero, // 👈 Yeh line add karo
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: categor.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 0.60,
                              ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.network(
                                    // "assets/pieces.png",
                                    //categoryList[index]['imageUrl'].toString(),
                                    "${categor[index].imageUrl.toString()}",
                                    width: 144.w,
                                    height: 160.h,
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
                                        borderRadius: BorderRadius.circular(
                                          30.r,
                                        ),
                                        color: textColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                        color: Color.fromARGB(
                                          255,
                                          102,
                                          102,
                                          102,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  width: 140.w,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    //"5 in 1 Lipstick Red Edition & Nud",
                                    categor[index].name,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: Color.fromARGB(255, 102, 102, 102),
                                      letterSpacing: -0.80,
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
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => Center(child: Text(e.toString())),
              loading:
                  () => SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(child: CircularProgressIndicator()),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
