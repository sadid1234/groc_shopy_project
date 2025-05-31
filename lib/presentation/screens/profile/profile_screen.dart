// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';
// import 'package:groc_shopy/core/custom_assets/assets.gen.dart';
// import 'package:groc_shopy/utils/app_colors/app_colors.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:groc_shopy/utils/text_style/text_style.dart';

// import '../../widgets/payment_modal/payment_modal.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen>
//     with SingleTickerProviderStateMixin {
//   bool isTotal = true;
//   late TabController _tabController;
//   final Color darkGray = const Color(0xFF858585);
//   final List<Map<String, dynamic>> recently = [
//     {
//       'store': 'Shawopno',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Minabazar',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Agora',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     }
//   ];
//   final List<Map<String, dynamic>> total = [
//     {
//       'store': 'Shawopno',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Minabazar',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Agora',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Shawopno',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Minabazar',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Agora',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Shawopno',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Minabazar',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     },
//     {
//       'store': 'Agora',
//       'items': 'Apple, Chicken, Bread',
//       'price': '\$140',
//       'image': Assets.images.invoice.path,
//     }
//   ].reversed.toList();

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Widget receiptItem(Map<String, dynamic> receipt) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.h),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 70.w,
//             height: 70.h,
//             padding: EdgeInsets.all(4.w),
//             decoration: BoxDecoration(
//               border: Border(right: BorderSide(color: Colors.grey.shade300)),
//             ),
//             child: Image.asset(
//               receipt['image'],
//               fit: BoxFit.contain,
//             ),
//           ),
//           Gap(10.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   receipt['store'],
//                   style: AppStyle.roboto12w400C000000,
//                 ),
//                 Gap(4.h),
//                 Text(
//                   'Items: ${receipt['items']}',
//                   style: AppStyle.roboto10w400CB2000000,
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             receipt['price'],
//             style: AppStyle.roboto12w400CFFD673,
//           ),
//           Gap(10.w),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: Image.asset(
//                       Assets.icons.arrowBackGrey.path,
//                     ),
//                   ),
//                   Text(
//                     AppStrings.profile,
//                     style: AppStyle.kohSantepheap16w700C3F3F3F,
//                   ),
//                   const Icon(Icons.more_horiz, color: Colors.grey),
//                 ],
//               ),
//             ),
//             Gap(20.h),
//             Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   width: 350.w,
//                   height: 90.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     image: DecorationImage(
//                       image: AssetImage(Assets.images.brocoli.path),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 55.h,
//                   child: CircleAvatar(
//                     radius: 36.r,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 32.r,
//                       backgroundImage:
//                           AssetImage(Assets.images.profileImage.path),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Gap(40.h),
//             Text(
//               'Alex Thomson',
//               style: AppStyle.kohSantepheap16w700C3F3F3F,
//             ),
//             Gap(4.h),
//             Text(
//               'Manager',
//               style: AppStyle.roboto12w400C80000000,
//             ),
//             Gap(2.h),
//             Text(
//               AppStrings.appName,
//               style: AppStyle.robotoSerif12w500C000000,
//             ),
//             Gap(47.h),
//             Align(
//               alignment: Alignment.center,
//               child: Text(
//                 AppStrings.addedReceipt,
//                 style: AppStyle.kohSantepheap16w700C000000,
//               ),
//             ),
//             Gap(21.h),
//             SizedBox(
//               width: 349.w,
//               height: 118.h,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: 0,
//                     top: 0,
//                     child: Container(
//                       width: 349.w,
//                       height: 118.h,
//                       decoration: ShapeDecoration(
//                         color: AppColors.yellowFFD673,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 81.w,
//                     top: 70.h,
//                     child: GestureDetector(
//                       onTap: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => const PaymentModal(),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 25.w, vertical: 5.h),
//                         decoration: ShapeDecoration(
//                           color: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50.r),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               AppStrings.upgradeFrom,
//                               style: AppStyle.inter14w500C000000,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 56.w,
//                     top: 35.h,
//                     child: SizedBox(
//                       width: 236.w,
//                       height: 22.h,
//                       child: Text(
//                         AppStrings.unlockExclusiveFeatures,
//                         textAlign: TextAlign.center,
//                         style: AppStyle.roboto11w400CFFFFFF,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 123.w,
//                     top: 14.h,
//                     child: SizedBox(
//                       width: 150.w,
//                       height: 14.h,
//                       child: Text(
//                         AppStrings.appName,
//                         style: AppStyle.robotoSerif16w700CFFFFFF,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Gap(21.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildRoleTab(AppStrings.recently, !isTotal, () {
//                   setState(() {
//                     isTotal = false;
//                   });
//                 }),
//                 _buildRoleTab(AppStrings.total, isTotal, () {
//                   setState(() {
//                     isTotal = true;
//                   });
//                 }),
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     child: ListView.builder(
//                       itemCount: isTotal ? total.length : recently.length,
//                       itemBuilder: (context, index) {
//                         return receiptItem(
//                             isTotal ? total[index] : recently[index]);
//                       },
//                     ),
//                   ),
//                   const Center(
//                     child: Text('Total tab content'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _buildRoleTab(String title, bool selected, VoidCallback onTap) {
//   final color =
//       selected ? AppColors.yellowFFD673 : AppColors.black50opacity80000000;
//   final fontWeight = selected ? FontWeight.bold : FontWeight.normal;

//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       padding: EdgeInsets.symmetric(vertical: 8.h),
//       width: 175.w,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: AppStyle.roboto16w700CFFD673.copyWith(
//               fontWeight: fontWeight,
//               color: color,
//             ),
//           ),
//           Gap(12.h),
//           Container(
//             height: selected ? 4.h : 1.h,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.circular(3.r),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart'; // <-- add this for .tr
import 'package:groc_shopy/core/custom_assets/assets.gen.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

import '../../widgets/payment_modal/payment_modal.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isTotal = true;
  late TabController _tabController;
  final Color darkGray = const Color(0xFF858585);
  final List<Map<String, dynamic>> recently = [
    {
      'store': 'Shawopno',
      'items': 'Apple, Chicken, Bread',
      'price': '\$140',
      'image': Assets.images.invoice.path,
    },
    {
      'store': 'Minabazar',
      'items': 'Apple, Chicken, Bread',
      'price': '\$140',
      'image': Assets.images.invoice.path,
    },
    {
      'store': 'Agora',
      'items': 'Apple, Chicken, Bread',
      'price': '\$140',
      'image': Assets.images.invoice.path,
    }
  ];
  final List<Map<String, dynamic>> total = [
    {
      'store': 'Shawopno',
      'items': 'Apple, Chicken, Bread',
      'price': '\$140',
      'image': Assets.images.invoice.path,
    },
    // ... other items omitted for brevity ...
  ].reversed.toList();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget receiptItem(Map<String, dynamic> receipt) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Image.asset(
              receipt['image'],
              fit: BoxFit.contain,
            ),
          ),
          Gap(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receipt['store'],
                  style: AppStyle.roboto12w400C000000,
                ),
                Gap(4.h),
                Text(
                  'Items: ${receipt['items']}',
                  style: AppStyle.roboto10w400CB2000000,
                ),
              ],
            ),
          ),
          Text(
            receipt['price'],
            style: AppStyle.roboto12w400CFFD673,
          ),
          Gap(10.w),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    ),
                  ),
                  Text(
                    AppStrings.profile.tr,
                    style: AppStyle.kohSantepheap16w700C3F3F3F,
                  ),
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
            ),
            Gap(20.h),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 350.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: AssetImage(Assets.images.brocoli.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 55.h,
                  child: CircleAvatar(
                    radius: 36.r,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 32.r,
                      backgroundImage:
                          AssetImage(Assets.images.profileImage.path),
                    ),
                  ),
                ),
              ],
            ),
            Gap(40.h),
            Text(
              'Alex Thomson', // You can localize if dynamic or keep as is
              style: AppStyle.kohSantepheap16w700C3F3F3F,
            ),
            Gap(4.h),
            Text(
              'Manager', // same as above
              style: AppStyle.roboto12w400C80000000,
            ),
            Gap(2.h),
            Text(
              AppStrings.appName.tr,
              style: AppStyle.robotoSerif12w500C000000,
            ),
            Gap(47.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.addedReceipt.tr,
                style: AppStyle.kohSantepheap16w700C000000,
              ),
            ),
            Gap(21.h),
            SizedBox(
              width: 349.w,
              height: 118.h,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 349.w,
                      height: 118.h,
                      decoration: ShapeDecoration(
                        color: AppColors.yellowFFD673,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 81.w,
                    top: 70.h,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const PaymentModal(),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 5.h),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.upgradeFrom.tr,
                              style: AppStyle.inter14w500C000000,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 56.w,
                    top: 35.h,
                    child: SizedBox(
                      width: 236.w,
                      height: 22.h,
                      child: Text(
                        AppStrings.unlockExclusiveFeatures.tr,
                        textAlign: TextAlign.center,
                        style: AppStyle.roboto11w400CFFFFFF,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 123.w,
                    top: 14.h,
                    child: SizedBox(
                      width: 150.w,
                      height: 14.h,
                      child: Text(
                        AppStrings.appName.tr,
                        style: AppStyle.robotoSerif16w700CFFFFFF,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(21.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoleTab(AppStrings.recently.tr, !isTotal, () {
                  setState(() {
                    isTotal = false;
                  });
                }),
                _buildRoleTab(AppStrings.total.tr, isTotal, () {
                  setState(() {
                    isTotal = true;
                  });
                }),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ListView.builder(
                      itemCount: isTotal ? total.length : recently.length,
                      itemBuilder: (context, index) {
                        return receiptItem(
                            isTotal ? total[index] : recently[index]);
                      },
                    ),
                  ),
                  const Center(
                    child: Text('Total tab content'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildRoleTab(String title, bool selected, VoidCallback onTap) {
  final color =
      selected ? AppColors.yellowFFD673 : AppColors.black50opacity80000000;
  final fontWeight = selected ? FontWeight.bold : FontWeight.normal;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      width: 175.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppStyle.roboto16w700CFFD673.copyWith(
              fontWeight: fontWeight,
              color: color,
            ),
          ),
          Gap(12.h),
          Container(
            height: selected ? 4.h : 1.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ],
      ),
    ),
  );
}
