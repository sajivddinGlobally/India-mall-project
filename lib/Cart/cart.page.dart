import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/Cart/model/cartquantityUpdate,model.dart';
import 'package:shopping_app/Cart/model/checkout.model.dart';
import 'package:shopping_app/Cart/service/cartController.dart';
import 'package:shopping_app/Cart/service/cartService.dart';
import 'package:shopping_app/config/pretty.dio.dart';
import 'package:shopping_app/constant/myColors.dart';
import 'package:shopping_app/screen/address.form.page.dart';
import 'package:shopping_app/screen/provider/address.provider.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  List<Map<String, String>> decoreList = [
    {"imageUrl": "assets/detailslip.png"},
    {"imageUrl": "assets/makup1.png"},
    {"imageUrl": "assets/dec.png"},
  ];
  bool btnLoder = false;
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: defaultColor,
      body: cartData.when(
        data: (cart) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cart.cart.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return CaartTabs(
                      product_id: cart.cart[index].productId.toString(),
                      name: cart.cart[index].name,
                      regularPrice: cart.cart[index].subtotal.toString(),
                      totalprice: cart.cart[index].price,
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 30.h),
                  child: Text(
                    "Apply Coupon ",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 16, 27, 1),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: SizedBox(
                    height: 50.h,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          // top: 5.h,
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
                        hintText: "Select Coupon",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 102, 102, 102),
                        ),
                        suffixIcon: Container(
                          margin: EdgeInsets.only(
                            right: 10.w,
                            top: 6.h,
                            bottom: 6.h,
                          ),
                          width: 88.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: textColor,
                          ),
                          child: Center(
                            child: Text(
                              "Apply",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20.w, top: 30.h),
                //   child: Text(
                //     "Payment Info",
                //     style: GoogleFonts.inter(
                //       fontSize: 20.sp,
                //       fontWeight: FontWeight.w400,
                //       color: Color.fromARGB(255, 16, 27, 1),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10.h),
                // Padding(
                //   padding: EdgeInsets.only(left: 20.w, right: 20.h),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 170.h,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5.r),
                //       border: Border.all(
                //         color: Color.fromARGB(25, 16, 27, 1),
                //         width: 1.w,
                //       ),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.only(
                //         left: 15.w,
                //         right: 15.w,
                //         top: 15.h,
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 "Subtotal",
                //                 style: GoogleFonts.inter(
                //                   fontSize: 14.sp,
                //                   fontWeight: FontWeight.w400,
                //                   color: Color.fromARGB(255, 102, 102, 102),
                //                 ),
                //               ),
                //               // Text(
                //               //   "\$450.00",
                //               //   style: GoogleFonts.inter(
                //               //     fontSize: 14.sp,
                //               //     fontWeight: FontWeight.bold,
                //               //     color: Color.fromARGB(255, 102, 102, 102),
                //               //   ),
                //               // ),
                //               // Html(data: cart.cartSubtotal),
                //             ],
                //           ),

                //           SizedBox(height: 10.h),

                //           SizedBox(height: 10.h),
                //           Divider(
                //             color: Color.fromARGB(25, 0, 0, 0),
                //             thickness: 1,
                //           ),
                //           // SizedBox(height: 10.h),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 "Total ",
                //                 style: GoogleFonts.inter(
                //                   fontSize: 14.sp,
                //                   fontWeight: FontWeight.w400,
                //                   color: Color.fromARGB(255, 102, 102, 102),
                //                 ),
                //               ),
                //               // Html(data: cart.cartTotal)
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 18.h),
                Divider(color: Color.fromARGB(25, 0, 0, 0), thickness: 1),
                SizedBox(height: 17.h),
                GestureDetector(
                  onTap: () async {
                    setState(() => btnLoder = true);

                    try {
                      // Check if address exists first
                      final addressData = ref.read(addressProvider);
                      final hasAddress = await addressData.maybeWhen(
                        data: (address) => address != null,
                        orElse: () => false,
                      );

                      if (!hasAddress) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AddressFormPage(),
                          ),
                        );
                        return;
                      }

                      // Proceed to checkout
                      final service = CartService(await createDio());
                      await service.checkout(); // Ensure this returns a Future

                      Fluttertoast.showToast(
                        msg: "Order Placed Successfully",
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      );
                    } catch (e) {
                      Fluttertoast.showToast(
                        msg: "Checkout failed: ${e.toString()}",
                        backgroundColor: Colors.red,
                      );
                      debugPrint("Checkout Error: $e");
                    } finally {
                      setState(() => btnLoder = false);
                    }
                  },
                  child: Container(
                    height: 46.h,
                    decoration: BoxDecoration(
                      color: textColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child:
                          btnLoder == false
                              ? Text(
                                "Checkout",
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                              : CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(e.toString())),
        loading:
            () => Center(child: CircularProgressIndicator(color: textColor)),
      ),
    );
  }
}

String truncateString(String input, int maxLength) {
  if (input.length <= maxLength) {
    return input;
  }
  return input.substring(0, maxLength);
}

class CaartTabs extends StatefulWidget {
  final String product_id;
  final String name;
  final String regularPrice;
  final String totalprice;
  const CaartTabs({
    super.key,
    required this.product_id,
    required this.name,
    required this.regularPrice,
    required this.totalprice,
  });

  @override
  State<CaartTabs> createState() => _CaartTabsState();
}

class _CaartTabsState extends State<CaartTabs> {
  int count = 1;
  void increment() async {
    setState(() {
      count++;
    });
    final service = CartService(await createDio());
    // final response = await service.updateCart(UpdateeQ);
    final response = await service.updateCart(
      UpdateQuantityBody(
        productId: int.parse(widget.product_id),
        quantity: count,
      ),
    );
  }

  void decrement() async {
    if (count > 1) {
      setState(() {
        count--;
      });
      final service = CartService(await createDio());
      // final response = await service.updateCart(UpdateeQ);
      final response = await service.updateCart(
        UpdateQuantityBody(
          productId: int.parse(widget.product_id),
          quantity: count,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.h,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(25, 0, 0, 0), width: 1.w),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(4),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(5.r),
            //     child: Image.network(
            //       width: 130.w,
            //       height: 108.h,
            //       fit: BoxFit.cover,
            //       // "assets/detailslip.png",
            //       //decoreList[index]['imageUrl'].toString(),
            //       cart.cart[index].,
            //     ),
            //   ),
            // ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  // "Happy Birthday Decoration",
                  truncateString(widget.name, 25),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 16, 27, 1),
                  ),
                ),

                Html(data: widget.totalprice),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40.h,
                  child: Row(
                    children: [
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
                      Spacer(),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Container(
                      //     margin: EdgeInsets.only(top: 6.h),
                      //     width: 36.w,
                      //     height: 28.h,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5.r),
                      //       color: Color.fromARGB(25, 255, 0, 0),
                      //     ),
                      //     child: Center(
                      //       child: Icon(
                      //         Icons.delete,
                      //         color: Color.fromARGB(255, 255, 0, 0),
                      //         size: 20.sp,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
