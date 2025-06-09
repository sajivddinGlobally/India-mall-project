import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/Cart/cart.page.dart';
import 'package:shopping_app/account/account.page.dart';
import 'package:shopping_app/category/category.page.dart';
import 'package:shopping_app/category/service/categoryController.dart';
import 'package:shopping_app/constant/myColors.dart';
import 'package:shopping_app/particularSearch/particularSearch.page.dart';
import 'package:shopping_app/search/search.page.dart';
import 'package:shopping_app/search/service/allProductController.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int tabBottom = 0;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    final productProvider = ref.watch(allProductProvider);
    final categoryProvider = ref.watch(categoryController);

    if (productProvider.isLoading || categoryProvider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: textColor)),
      );
    }
    if (productProvider.error != null || categoryProvider.error != null) {
      return Scaffold(
        body: Center(
          child: Text(
            "Error: ${productProvider.error ?? categoryProvider.error}",
            style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: defaultColor,
      body: tabBottom == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: const BoxDecoration(
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
                            box.get("name")?.toString() ?? "Hello",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: const Color.fromARGB(255, 16, 27, 1),
                            ),
                          ),
                          Text(
                            "Jaipur, 302033",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: const Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(25, 0, 0, 0),
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: const Color.fromARGB(255, 16, 27, 1),
                            size: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 50.h,
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20.sp,
                            color: const Color.fromARGB(255, 153, 153, 153),
                          ),
                          hintText: "Search Anything",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: const Color.fromARGB(255, 153, 153, 153),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(25, 0, 0, 0),
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
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 232, 243),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Row(
                        children: [
                          const Icon(
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
                                  color: const Color.fromARGB(255, 150, 28, 130),
                                ),
                              ),
                              Text(
                                "Easy Return",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          VerticalDivider(
                            color: Colors.grey,
                            indent: 15,
                            endIndent: 15,
                            width: 1.w,
                          ),
                          const Spacer(),
                          const Icon(
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
                                  color: const Color.fromARGB(255, 150, 28, 130),
                                ),
                              ),
                              Text(
                                "Available",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          VerticalDivider(
                            color: Colors.grey,
                            indent: 15,
                            endIndent: 15,
                            width: 1.w,
                          ),
                          const Spacer(),
                          const Icon(
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
                                  color: const Color.fromARGB(255, 150, 28, 130),
                                ),
                              ),
                              Text(
                                "Price Item",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 100.h,
                    child: categoryProvider.when(
                      data: (categorydata) {
                        return ListView.builder(
                          itemCount: categorydata.length,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.w,
                                    height: 60.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 244, 232, 243),
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        categorydata[index].imageUrl ??
                                            "assets/placeholder.png",
                                        width: 60.w,
                                        height: 60.h,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            Image.asset(
                                          "assets/placeholder.png",
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  SizedBox(
                                    width: 75.w,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      categorydata[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: const Color.fromARGB(255, 102, 102, 102),
                                        letterSpacing: -0.70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Center(
                        child: Text(
                          error.toString(),
                          style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.red),
                        ),
                      ),
                      loading: () => Center(
                        child: CircularProgressIndicator(color: textColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                color: const Color.fromARGB(255, 16, 27, 1),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Deals ends in ",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: const Color.fromARGB(255, 102, 102, 102),
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
                        const Spacer(),
                        Container(
                          width: 75.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: const Color.fromARGB(25, 150, 28, 130),
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
                  DealsBody(showDiscount: true),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Image.asset("assets/shop.png"),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Text(
                        "Product for you",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 16, 27, 1),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 75.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: const Color.fromARGB(25, 150, 28, 130),
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
                      SizedBox(width: 20.w),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GridViewBody(),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 395.h,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 231, 243),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            right: 20.w,
                            top: 26.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Low Price Store",
                                style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 16, 27, 1),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 75.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: const Color.fromARGB(25, 150, 28, 130),
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
                        SizedBox(height: 20.h),
                        DealsBody(showDiscount: false),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : tabBottom == 1
              ? const CategoryPage()
              : tabBottom == 2
                  ? const CartPage()
                  : const AccountPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            tabBottom = value;
          });
        },
        currentIndex: tabBottom,
        selectedItemColor: textColor,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_sharp),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class GridViewBody extends ConsumerStatefulWidget {
  const GridViewBody({super.key});

  @override
  ConsumerState<GridViewBody> createState() => _GridViewBodyState();
}

class _GridViewBodyState extends ConsumerState<GridViewBody> {
  @override
  Widget build(BuildContext context) {
    final productProvider = ref.watch(allProductProvider);
    return productProvider.when(
      data: (product) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ParticularSearchPage(id: product[index].id),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      product[index].imageUrl,
                      height: 235.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        "assets/placeholder.png",
                        height: 235.h,
                        fit: BoxFit.cover,
                      ),
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
                            Icon(Icons.star, color: Colors.white, size: 15.sp),
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
                        "(12 reviews)",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: const Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 159.w,
                    child: Text(
                      product[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    product[index].regularPrice,
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
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
          style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.red),
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator(color: textColor)),
    );
  }
}

class DealsBody extends ConsumerStatefulWidget {
  final bool showDiscount;
  const DealsBody({super.key, required this.showDiscount});

  @override
  ConsumerState<DealsBody> createState() => _DealsBodyState();
}

class _DealsBodyState extends ConsumerState<DealsBody> {
  @override
  Widget build(BuildContext context) {
    final productProvider = ref.watch(allProductProvider);
    return productProvider.when(
      data: (data) {
        return SizedBox(
          height: 310.h,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ParticularSearchPage(id: data[index].id),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              data[index].imageUrl,
                              width: 166.w,
                              height: 200.h,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                "assets/placeholder.png",
                                width: 166.w,
                                height: 200.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (widget.showDiscount && data[index].regularPrice != null)
                            Positioned(
                              top: 19.h,
                              child: Image.asset(
                                "assets/of.png",
                                width: 50.w,
                                height: 50.h,
                              ),
                            ),
                          if (widget.showDiscount && data[index].regularPrice != null)
                            Positioned(
                              top: 20.h,
                              left: 15.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data[index].regularPrice}%",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "OFF",
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
                             "(15 reviews)",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              color: const Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: 159.w,
                        child: Text(
                          data[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: const Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        data[index].regularPrice,
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
          style: GoogleFonts.inter(fontSize: 16.sp, color: Colors.red),
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator(color: textColor)),
    );
  }
}