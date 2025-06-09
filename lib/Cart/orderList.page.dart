import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderListPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "order_id": 10789,
      "status": "pending",
      "total": "1761.86",
      "currency": "INR",
      "date_created": "2025-06-02 09:20:24",
      "items": [
        {
          "product_id": 5036,
          "product_name":
              "13Pc-Makeup Combo Kit | Primer, Foundation, Lipstick & More",
          "quantity": 7,
          "total": "1103.39"
        },
        {
          "product_id": 5215,
          "product_name":
              "Tya 6155 Makeup Kit with Brushes + Eyeliner + Blender",
          "quantity": 3,
          "total": "658.47"
        }
      ]
    },
    {
      "order_id": 10787,
      "status": "pending",
      "total": "1761.86",
      "currency": "INR",
      "date_created": "2025-05-31 16:24:50",
      "items": [
        {
          "product_id": 5036,
          "product_name":
              "13Pc-Makeup Combo Kit | Primer, Foundation, Lipstick & More",
          "quantity": 7,
          "total": "1103.39"
        },
        {
          "product_id": 5215,
          "product_name":
              "Tya 6155 Makeup Kit with Brushes + Eyeliner + Blender",
          "quantity": 3,
          "total": "658.47"
        }
      ]
    },
    {
      "order_id": 10784,
      "status": "pending",
      "total": "3583.05",
      "currency": "INR",
      "date_created": "2025-05-31 15:54:39",
      "items": [
        {
          "product_id": 6444,
          "product_name":
              "Matte Me Liquid Lipstick Combo (Pack of 2 - Maroon & Red)",
          "quantity": 2,
          "total": "235.59"
        },
        {
          "product_id": 5741,
          "product_name":
              "6Pcs Matte Liquid Lipstick Set (Long Lasting, Waterproof)",
          "quantity": 14,
          "total": "3072.88"
        },
        {
          "product_id": 6399,
          "product_name": "Huda Matte Lipstick Combo (8 Pcs)",
          "quantity": 2,
          "total": "274.58"
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: Text("Pending Orders"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final date = DateFormat("yyyy-MM-dd HH:mm:ss")
              .parse(order["date_created"]);
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
                      Text("Order ID: #${order["order_id"]}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded, size: 18, color: Colors.grey),
                      SizedBox(width: 6),
                      Text(DateFormat.yMMMMd().format(date)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.check_circle, size: 18, color: Colors.orange),
                      SizedBox(width: 6),
                      Text("Status: ${order["status"].toUpperCase()}",
                          style: TextStyle(color: Colors.deepOrange)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee, size: 18, color: Colors.green),
                      SizedBox(width: 6),
                      Text("Total: ₹${order["total"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green.shade700)),
                    ],
                  ),
                  Divider(height: 20),
                  Text("Items:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Column(
                    children: order["items"].map<Widget>((item) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.shopping_bag, color: Colors.pink.shade400),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["product_name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Chip(
                                        label: Text("Qty: ${item["quantity"]}"),
                                        backgroundColor: Colors.pink.shade100,
                                      ),
                                      SizedBox(width: 6),
                                      Chip(
                                        label: Text("₹${item["total"]}"),
                                        backgroundColor: Colors.green.shade100,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}