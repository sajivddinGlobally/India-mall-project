import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/account/controller/orderLiat.provider.dart';
import 'package:shopping_app/constant/myColors.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  List<Map<String, String>> orderList = [
    {"imageUrl": "assets/detailslip.png"},
    {"imageUrl": "assets/makup.png"},
  ];
  @override
  Widget build(BuildContext context) {
    final orderList = ref.watch(orderListProvider);
    return Scaffold(
      backgroundColor: defaultColor,
      body: orderList.when(
        data: (snapshot) {
          return Column(
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
                    "Manage Order",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 16, 27, 1),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(12),
                itemCount: snapshot.orders.length,
                itemBuilder: (context, index) {
                  final order = snapshot.orders[index];
                  final date = DateFormat(
                    "yyyy-MM-dd HH:mm:ss",
                  ).parse(order.dateCreated.toString());
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 6,
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.receipt_long, color: Colors.pink),
                              SizedBox(width: 8),
                              Text(
                                "Order ID: #${order.orderId}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 6),
                              Text(DateFormat.yMMMMd().format(date)),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 18,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Status: ${order.status.toUpperCase()}",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 18,
                                color: Colors.green,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Total: ₹${order.total}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 20),
                          Text(
                            "Items:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Column(
                            children:
                                order.items.entries.map<Widget>((entry) {
                                  final item = entry.value;
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 6),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.pink.shade50,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.shopping_bag,
                                          color: Colors.pink.shade400,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.productName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Chip(
                                                    label: Text(
                                                      "Qty: ${item.quantity}",
                                                    ),
                                                    backgroundColor:
                                                        Colors.pink.shade100,
                                                  ),
                                                  SizedBox(width: 6),
                                                  Chip(
                                                    label: Text(
                                                      "₹${item.total}",
                                                    ),
                                                    backgroundColor:
                                                        Colors.green.shade100,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
        error: (err, stack) {
          return Center(child: Text("$err"));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
