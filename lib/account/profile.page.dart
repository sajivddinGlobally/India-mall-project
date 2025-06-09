
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/account/account.page.dart';
import 'package:shopping_app/account/order.page.dart';
import 'package:shopping_app/category/whishlist.page.dart';
import 'package:shopping_app/constant/myColors.dart';
import 'package:shopping_app/home/home.page.dart';
import 'package:shopping_app/login/login.page.dart';
import 'package:shopping_app/screen/address.list.page.dart' show AddressListPage;


class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  File? _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        _image = File(PickedFile.path);
      });
    }
  }

  Future getImageFromCarmera() async {
    final PickedFile = await picker.pickImage(source: ImageSource.camera);
    if (PickedFile != null) {
      setState(() {
        _image = File(PickedFile.path);
      });
    }
  }

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  getImageFromGallery();
                },
                child: Text("Gallery"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  getImageFromCarmera();
                },
                child: Text("Camera"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    var token = box.get("token");
    return Scaffold(
      backgroundColor: defaultColor,
      body: Column(
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
                "Manage Profile",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 16, 27, 1),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.h),
            child: Stack(
              clipBehavior: Clip.none, // 👈 Yeh add karein
              children: [
                Image.asset("assets/profleimage.png"),
                Positioned(
                  bottom: -30,
                  left: 0.w,
                  right: 0.w,
                  child: GestureDetector(
                    onTap: () {
                      showOptions();
                    },
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 249, 242, 238),
                      ),
                      child:
                          _image == null
                              ? Center(
                                child: Text(
                                  "NJ",
                                  style: GoogleFonts.inter(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                              )
                              : CircleAvatar(
                                radius: 50.r,
                                backgroundImage: FileImage(_image!),
                                backgroundColor: Colors.transparent,
                              ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40.h,
                  left: 210.w,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: textColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.edit_square,
                        color: Colors.white,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          Center(
            child: Column(
              children: [
                Text(
                  "${box.get("name") ?? "Nick Jones "}",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 27, 1),
                  ),
                ),
                Text(
                  "${box.get("email") ?? "Jonesnick32@gmail.com"}",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 336.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Color.fromARGB(25, 16, 27, 1),
                  width: 1.w,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => OrderPage(),
                              ),
                            );
                          },
                          child: SettingBody(
                            icon: Icon(Icons.online_prediction_sharp),
                            name: 'Manage Order',
                            isShowdivider: true,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => WhishlistPage(),
                              ),
                            );
                          },
                          child: SettingBody(
                            icon: Icon(Icons.favorite_border),
                            name: 'Manage Wishlist ',
                            isShowdivider: true,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => AddressListPage()));
                          },
                          child: SettingBody(
                            icon: Icon(Icons.location_on_sharp),
                            name: 'Manage Address',
                            isShowdivider: true,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () {
                            box.clear();
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                            Fluttertoast.showToast(
                              msg: "Delete your account",
                              backgroundColor: textColor,
                              textColor: Colors.white,
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline_rounded,
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "Delete your account ",
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, size: 20.sp),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(color: Color.fromARGB(25, 0, 0, 0), thickness: 1),
                    SizedBox(height: 10.h),
                    if (token == null) ...[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.login,
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Login",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 20.sp),
                          ],
                        ),
                      ),
                    ] else ...[
                      GestureDetector(
                        onTap: () {
                          box.clear();
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                          // ref.invalidate(allProductProvider);
                          Fluttertoast.showToast(
                            msg: "Logout Successful",
                            backgroundColor: textColor,
                            textColor: Colors.white,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Logout",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 20.sp),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
