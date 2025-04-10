import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/constant/myColors..dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 217, 217, 217),
                  ),
                  child: Image.asset("assets/girl.png"),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello User Name",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Color.fromARGB(255, 16, 27, 1),
                      ),
                    ),
                    Text(
                      "Jaipur, 302033",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        color: Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
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
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SizedBox(
                height: 50.h,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8.h, right: 8.w),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.sp,
                      color: Color.fromARGB(255, 153, 153, 153),
                    ),
                    hintText: "Search Anything",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 153, 153, 153),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 1.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color.fromARGB(25, 0, 0, 0),
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 77.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 232, 243),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 35.w, right: 35.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.repeat,
                      color: Color.fromARGB(255, 150, 28, 130),
                    ),
                    SizedBox(width: 6.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "7 days",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 150, 28, 130),
                          ),
                        ),
                        Text(
                          "Easy Return",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    VerticalDivider(
                      color: Colors.grey,
                      indent: 15,
                      endIndent: 15,
                      width: 1.w,
                    ),
                    Spacer(),
                    Icon(
                      Icons.repeat,
                      color: Color.fromARGB(255, 150, 28, 130),
                    ),
                    SizedBox(width: 6.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "COD",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 150, 28, 130),
                          ),
                        ),
                        Text(
                          "Available",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    VerticalDivider(
                      color: Colors.grey,
                      indent: 15,
                      endIndent: 15,
                      width: 1.w,
                    ),
                    Spacer(),
                    Icon(
                      Icons.repeat,
                      color: Color.fromARGB(255, 150, 28, 130),
                    ),
                    SizedBox(width: 6.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Lowest",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 150, 28, 130),
                          ),
                        ),
                        Text(
                          "Price Item",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 244, 232, 243),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.qr_code_outlined,
                            color: Color.fromARGB(255, 150, 28, 130),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        textAlign: TextAlign.center,
                        "All\n Categories",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  AllCategorBody(
                    image: "assets/home.png",
                    text: 'Home &\nKitchen',
                  ),
                  Spacer(),
                  AllCategorBody(
                    image: "assets/beauty.png",
                    text: 'Beauty &\nPersonal care',
                  ),
                  Spacer(),
                  AllCategorBody(image: "assets/toy.png", text: 'Toy &\nGames'),
                  Spacer(),
                  AllCategorBody(
                    image: "assets/kids.png",
                    text: 'Kids\nAccessories',
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deal of the day",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 16, 27, 1),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Deals ends in ",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                          Text(
                            "- 04:45:00",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 75.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Color.fromARGB(25, 150, 28, 130),
                    ),
                    child: Center(
                      child: Text(
                        "View All",
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
            SizedBox(height: 15.h),
            DealsBody(),
          ],
        ),
      ),
    );
  }
}

class DealsBody extends StatefulWidget {
  const DealsBody({super.key});

  @override
  State<DealsBody> createState() => _DealsBodyState();
}

class _DealsBodyState extends State<DealsBody> {
  List<Map<String, String>> myList = [
    {
      "lipisticImage": "assets/lipistic.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "512",
      "title": "5 in 1 Lipstick Red Edition & Nud",
      "ammount": "\$450.00",
    },
    {
      "lipisticImage": "assets/butter.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "512",
      "title": "1 KG Butter Paper for Roti, Cake",
      "ammount": "\$150.00",
    },
    {
      "lipisticImage": "assets/birthday.png",
      "ofImage": "assets/of.png",
      "text": "20%",
      "offtext": "OFF",
      "rating": "4.5",
      "review": "512",
      "title": "37 Pc Birthday Decoration Items:Red Banner",
      "ammount": "\$450.00",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      // color: Colors.yellow,
      child: ListView.builder(
        itemCount: myList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      // "assets/lipistic.png"
                      width: 166.w,
                      height: 200.h,
                      fit: BoxFit.cover,
                      myList[index]['lipisticImage'].toString(),
                    ),
                    Positioned(
                      top: 19.h,
                      child: Image.asset(
                        // "assets/of.png",
                        myList[index]['ofImage'].toString(),
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      left: 15.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // "20%",
                            myList[index]['text'].toString(),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            // "OFF",
                            myList[index]['offtext'].toString(),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                          Icon(Icons.star, color: Colors.white, size: 15.sp),
                          Text(
                            // "4.5",
                            myList[index]['rating'].toString(),
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
                      // "(512 reviews)",
                      myList[index]['review'].toString(),
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
                    // "5 in 1 Lipstick Red Edition & Nud",
                    myList[index]['title'].toString(),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color.fromARGB(255, 102, 102, 102),
                    ),
                  ),
                ),
                Text(
                  // "\$450.00",
                  myList[index]['ammount'].toString(),
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AllCategorBody extends StatefulWidget {
  final String image;
  final String text;
  const AllCategorBody({super.key, required this.image, required this.text});

  @override
  State<AllCategorBody> createState() => _AllCategorBodyState();
}

class _AllCategorBodyState extends State<AllCategorBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            // "assets/home.png",
            widget.image,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          // "Home &\nKitchen",
          widget.text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: Color.fromARGB(255, 102, 102, 102),
          ),
        ),
      ],
    );
  }
}
