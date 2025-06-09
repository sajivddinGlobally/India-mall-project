
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/screen/address.form.page.dart';
import 'package:shopping_app/screen/provider/address.provider.dart';

class AddressListPage extends ConsumerStatefulWidget {
  const AddressListPage({super.key});

  @override
  ConsumerState<AddressListPage> createState() => _AddressListPageState();
}

class _AddressListPageState extends ConsumerState<AddressListPage> {
  final addresses = [
    {
      'name': 'Rahul Sharma',
      'phone': '9876543210',
      'address':
          'Flat No. 201, Green Residency, Near HDFC Bank, MG Road, Bangalore - 560001',
      'type': 'Home',
    },
    {
      'name': 'Priya Patel',
      'phone': '9123456789',
      'address': 'Office 3rd Floor, Tech Park, Sector 44, Gurgaon - 122003',
      'type': 'Work',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    final addressdata = ref.watch(addressProvider);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: addressdata.when(data: (snapshot){
        return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  margin: EdgeInsets.only(bottom: 16.h),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          "${box.get("name") ?? "Nick Jones "}",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Email: ${box.get("email") ?? "Nick Jones "}',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "${snapshot.addresses.address6835528392Fb8642407530.addressLine}, ${snapshot.addresses.address6835528392Fb8642407530.city}, ${snapshot.addresses.address6835528392Fb8642407530.state}, ${snapshot.addresses.address6835528392Fb8642407530.zipcode}",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
          ],
        ),
      );
      }, error: (err, stack) {
      return Center(
        child: Text(err.toString()),
      );
      }, loading: (){
        return CircularProgressIndicator();
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddressFormPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF961C82),
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          label: Text(
            'Add New Address',
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
