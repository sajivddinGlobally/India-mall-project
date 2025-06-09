import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/account/profile.page.dart';
import 'package:shopping_app/constant/myColors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
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
                "Profile",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                  color: Color.fromARGB(255, 16, 27, 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 404.h,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: SettingBody(
                        icon: Icon(Icons.person_2_outlined),
                        name: 'Manage Profile',
                        isShowdivider: true,
                      ),
                    ),
                    SettingBody(
                      icon: Icon(Icons.call_outlined),
                      name: 'WhatsApp Support',
                      isShowdivider: true,
                    ),
                    SettingBody(
                      icon: Icon(Icons.local_shipping_outlined),
                      name: 'Shipping Policy',
                      isShowdivider: true,
                    ),
                    SettingBody(
                      icon: Icon(Icons.receipt_long_rounded),
                      name: 'Return & Refund Policy',
                      isShowdivider: true,
                    ),
                    SettingBody(
                      icon: Icon(Icons.privacy_tip_outlined),
                      name: 'Privacy Policy',
                      isShowdivider: true,
                    ),
                    SettingBody(
                      icon: Icon(Icons.blinds_closed),
                      name: 'Billing Terms and Payment',
                      isShowdivider: false,
                    ),
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

class SettingBody extends StatelessWidget {
  final Icon icon;
  final String name;
  final bool isShowdivider;
  const SettingBody({
    super.key,
    required this.icon,
    required this.name,
    required this.isShowdivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon.icon, color: Color.fromARGB(255, 16, 27, 1)),
            SizedBox(width: 8.w),
            Text(
              // "Manage Profile",
              name,
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 16, 27, 1),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20.sp),
          ],
        ),
        SizedBox(height: 10.h),
        isShowdivider
            ? Divider(color: Color.fromARGB(25, 0, 0, 0), thickness: 1)
            : Container(),
      ],
    );
  }
}
