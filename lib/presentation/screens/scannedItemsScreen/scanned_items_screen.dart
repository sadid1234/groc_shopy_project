import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/presentation/widgets/custom_navbar/custom_navbar.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';

class ScannedItemsScreen extends StatelessWidget {
  final File? image; // Add this

  ScannedItemsScreen({Key? key, required this.image}) : super(key: key);
  final List<Map<String, dynamic>> scannedItems = [
    {
      "name": "Fresh Milk",
      "date": "2025-05-01",
      "price": "\$120",
      "status": "Processed",
    },
    {
      "name": "Chicken",
      "date": "2025-05-01",
      "price": "\$300",
      "status": "Processed",
    },
    {
      "name": "Artichoke",
      "date": "2025-05-01",
      "price": "\$40",
      "status": "Processed",
    },
    {
      "name": "Broccoli",
      "date": "2025-05-01",
      "price": "\$100",
      "status": "Processed",
    },
    {
      "name": "Meat",
      "date": "2025-05-01",
      "price": "\$500",
      "status": "Processed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFFAF7F1), // light background like your screenshot
      appBar: AppBar(
        backgroundColor: Color(0xFFFAF7F1),
        elevation: 0,
        leading: BackButton(color: Colors.grey),
        centerTitle: true,
        title: Text(
          "Grocery Items",
          style: GoogleFonts.kohSantepheap(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            letterSpacing: 0.8,
          ),
        ),
        actions: [
          Icon(Icons.more_horiz, color: Colors.grey),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image area placeholder (like invoice image in your UI)
            Container(
              height: 230.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                image: image != null
                    ? DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage('assets/invoice_placeholder.png'),
                        fit: BoxFit.cover,
                      ),
              ),
            ),

            SizedBox(height: 12),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Scans",
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 0.8,
                ),
              ),
            ),

            Container(
              height: 284.h,
              margin: EdgeInsets.only(bottom: 40.h),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ListView.separated(
                  itemCount: scannedItems.length,
                  separatorBuilder: (_, __) =>
                      Divider(height: 24, color: Colors.grey.shade300),
                  itemBuilder: (context, index) {
                    final item = scannedItems[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Color(0xFFF2F2F2), // light orange background
                              child: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.orange.shade200),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['name'],
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      letterSpacing: 0.8,
                                    )),
                                Text(item['date'],
                                    style: GoogleFonts.roboto(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.5),
                                      letterSpacing: 0.8,
                                    )),
                                Text(item['price'],
                                    style: GoogleFonts.roboto(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary,
                                      letterSpacing: 0.8,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 70.w,
                          height: 25.h,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            item['status'],
                            style: GoogleFonts.roboto(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomOutlinedButton(
                  width: 86,
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  text: 'Edit',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20),
                CustomOutlinedButton(
                  borderColor: Colors.black,
                  textColor: Colors.white,
                  backgroundColor: AppColors.primary,
                  width: 86,
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  text: 'save',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor; // Default background color
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double? width;
  final double? height;

  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderColor = Colors.black,
    this.textColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 30,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
