import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/Cart/service/cartService.dart';
import 'package:shopping_app/config/pretty.dio.dart';
import 'package:shopping_app/screen/models/addresBody.model.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({super.key});

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();
  bool btnLoder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Fill Your Address",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: Color.fromARGB(255, 16, 27, 1),
          ),
        ),
      ),
      body:  btnLoder == true? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              AddressBody(
                txt: "address_line",
                hintxt: "Enter Your Address",
                controller: addressController,
                type: TextInputType.streetAddress,
              ),
              SizedBox(height: 10.h),
              AddressBody(
                txt: "city",
                hintxt: "Enter Your city",
                controller: cityController,
                type: TextInputType.text,
              ),
              SizedBox(height: 10.h),
              AddressBody(
                txt: "state",
                hintxt: "Enter Your state",
                controller: stateController,
                type: TextInputType.text,
              ),
              SizedBox(height: 10.h),
              AddressBody(
                txt: "zipcode",
                hintxt: "Enter Your zipcode",
                controller: zipController,
                type: TextInputType.number,
              ),
              SizedBox(height: 10.h),
              AddressBody(
                txt: "country",
                hintxt: "Enter Your country",
                controller: countryController,
                type: TextInputType.text,
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    btnLoder = true;
                  });
                  final service = CartService(await createDio());
                  final response = await service.postAddress(AddressBodyModel(addressLine: addressController.text, city: cityController.text, state: stateController.text, zipcode: zipController.text, country: countryController.text, isDefault: true));
                  setState(() {
                    btnLoder = false;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 46.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xFF961C82),
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressBody extends StatelessWidget {
  final String txt;
  final String hintxt;
  final TextEditingController controller;
  final TextInputType type;
  const AddressBody({
    super.key,
    required this.txt,
    required this.hintxt,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            color: Color.fromARGB(255, 16, 27, 1),
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 8.h, right: 20.w),
            hintText: hintxt,
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
      ],
    );
  }
}
