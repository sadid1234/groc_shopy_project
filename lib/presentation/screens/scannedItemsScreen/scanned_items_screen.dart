// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:groc_shopy/presentation/widgets/custom_navbar/custom_navbar.dart';
// import 'package:groc_shopy/utils/app_colors/app_colors.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:groc_shopy/utils/text_style/text_style.dart';

// import '../../../core/custom_assets/assets.gen.dart';

// class ScannedItemsScreen extends StatelessWidget {
//   final File? image; // Add this

//   ScannedItemsScreen({Key? key, required this.image}) : super(key: key);
//   final List<Map<String, dynamic>> scannedItems = [
//     {
//       "name": "Fresh Milk",
//       "date": "2025-05-01",
//       "price": "\$120",
//       "status": "Processed",
//     },
//     {
//       "name": "Chicken",
//       "date": "2025-05-01",
//       "price": "\$300",
//       "status": "Processed",
//     },
//     {
//       "name": "Artichoke",
//       "date": "2025-05-01",
//       "price": "\$40",
//       "status": "Processed",
//     },
//     {
//       "name": "Broccoli",
//       "date": "2025-05-01",
//       "price": "\$100",
//       "status": "Processed",
//     },
//     {
//       "name": "Meat",
//       "date": "2025-05-01",
//       "price": "\$500",
//       "status": "Processed",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // light background like your screenshot
//       // appBar: AppBar(
//       //   backgroundColor: Color(0xFFFAF7F1),
//       //   elevation: 0,
//       //   leading: BackButton(color: Colors.grey),
//       //   centerTitle: true,
//       //   title: Text(
//       //     AppStrings.groceryItems,
//       //     style: AppStyle.kohSantepheap16w700C000000,
//       //   ),
//       //   actions: [
//       //     Icon(Icons.more_horiz, color: Colors.grey),
//       //     SizedBox(width: 16),
//       //   ],
//       // ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 color: AppColors.backgroundColor,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         context.pop();
//                       },
//                       child: Image.asset(
//                         Assets.icons.arrowBackGrey.path,
//                       ),
//                     ),
//                     Text(
//                       AppStrings.groceryItems,
//                       style: AppStyle.kohSantepheap16w700C3F3F3F,
//                     ),
//                     Icon(Icons.more_horiz, color: Colors.grey),
//                   ],
//                 ),
//               ),
//               // Image area placeholder (like invoice image in your UI)
//               Container(
//                 height: 230.h,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                   image: image != null
//                       ? DecorationImage(
//                           image: FileImage(image!),
//                           fit: BoxFit.cover,
//                         )
//                       : DecorationImage(
//                           image: AssetImage(Assets.images.invoicePlaceholder.path),
//                           fit: BoxFit.cover,
//                         ),
//                 ),
//               ),
//               //pic
//               SizedBox(height: 12),

//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   AppStrings.recentScans,
//                   style: AppStyle.roboto14w500C000000,
//                 ),
//               ),

//               Container(
//                 height: 284.h,
//                 margin: EdgeInsets.only(bottom: 40.h),
//                 child: Container(
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: ListView.separated(
//                     itemCount: scannedItems.length,
//                     separatorBuilder: (_, __) =>
//                         Divider(height: 24, color: Colors.grey.shade300),
//                     itemBuilder: (context, index) {
//                       final item = scannedItems[index];
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 20,
//                                 backgroundColor: Color(
//                                     0xFFF2F2F2), // light orange background
//                                 child: Icon(Icons.shopping_cart_outlined,
//                                     color: Colors.orange.shade200),
//                               ),
//                               SizedBox(width: 10),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(item['name'],
//                                       style: AppStyle.roboto14w400C000000),
//                                   Text(item['date'],
//                                       style: AppStyle.roboto10w400C80000000),
//                                   Text(item['price'],
//                                       style: AppStyle.roboto10w400CFFD673),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             width: 70.w,
//                             height: 28.h,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 12, vertical: 6),
//                             decoration: BoxDecoration(
//                               color: Colors.orange.shade200,
//                               borderRadius: BorderRadius.circular(24),
//                             ),
//                             child: Text(
//                               item['status'],
//                               style: AppStyle.roboto8w500C000000,
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomOutlinedButton(
//                     width: 86,
//                     height: 32,
//                     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//                     text: 'Edit',
//                     onPressed: () {
//                       context.pop();
//                     },
//                   ),
//                   SizedBox(width: 20),
//                   CustomOutlinedButton(
//                     borderColor: Colors.black,
//                     textColor: Colors.white,
//                     backgroundColor: AppColors.yellowFFD673,
//                     width: 86,
//                     height: 32,
//                     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//                     text: 'save',
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomOutlinedButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final Color borderColor;
//   final Color textColor;
//   final Color backgroundColor; // Default background color
//   final EdgeInsetsGeometry padding;
//   final double borderRadius;
//   final double? width;
//   final double? height;

//   const CustomOutlinedButton({
//     Key? key,
//     required this.text,
//     required this.onPressed,
//     this.borderColor = Colors.black,
//     this.textColor = Colors.black,
//     this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//     this.backgroundColor = Colors.transparent,
//     this.borderRadius = 30,
//     this.width,
//     this.height,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: width,
//         height: height,
//         padding: padding,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           border: Border.all(color: borderColor, width: 1),
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: Text(
//           text,
//           style: AppStyle.inter14w700CFFFFFF.copyWith(
//             color: textColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:groc_shopy/presentation/widgets/custom_navbar/custom_navbar.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

import '../../../core/custom_assets/assets.gen.dart';
import 'package:gap/gap.dart';

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                color: AppColors.backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Image.asset(
                        Assets.icons.arrowBackGrey.path,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    Text(
                      AppStrings.groceryItems,
                      style: AppStyle.kohSantepheap16w700C3F3F3F,
                    ),
                    Icon(Icons.more_horiz, color: Colors.grey, size: 24.sp),
                  ],
                ),
              ),

              // Image area placeholder (like invoice image in your UI)
              Container(
                height: 230.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(image!),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image:
                              AssetImage(Assets.images.invoicePlaceholder.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),

              Gap(12.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.recentScans,
                  style: AppStyle.roboto14w500C000000,
                ),
              ),

              Container(
                height: 284.h,
                margin: EdgeInsets.only(bottom: 40.h),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListView.separated(
                    itemCount: scannedItems.length,
                    separatorBuilder: (_, __) => Divider(
                      height: 24.h,
                      color: Colors.grey.shade300,
                    ),
                    itemBuilder: (context, index) {
                      final item = scannedItems[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundColor: const Color(0xFFF2F2F2),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.orange.shade200,
                                  size: 24.sp,
                                ),
                              ),
                              Gap(10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['name'],
                                      style: AppStyle.roboto14w400C000000),
                                  Text(item['date'],
                                      style: AppStyle.roboto10w400C80000000),
                                  Text(item['price'],
                                      style: AppStyle.roboto10w400CFFD673),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70.w,
                            height: 28.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade200,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Text(
                              item['status'],
                              style: AppStyle.roboto8w500C000000,
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
                    width: 86.w,
                    height: 32.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    text: 'Edit',
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  Gap(20.w),
                  CustomOutlinedButton(
                    borderColor: Colors.black,
                    textColor: Colors.white,
                    backgroundColor: AppColors.yellowFFD673,
                    width: 86.w,
                    height: 32.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    text: 'Save',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
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
          border: Border.all(color: borderColor, width: 1.w),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Text(
          text,
          style: AppStyle.inter14w700CFFFFFF.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
