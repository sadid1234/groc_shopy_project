import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/core/routes/route_path.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../widgets/custom_navbar/custom_navbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F3E8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row: Profile + icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: NetworkImage(
                              'https://randomuser.me/api/portraits/men/32.jpg'),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alex Thomson',
                              style: AppStyle.kohSantepheap16w700C3F3F3F,
                            ),
                            Text(
                              'Your grocery expenses at a glance',
                              style: AppStyle.roboto12w400C80000000,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            Assets.icons.shop.path,
                            // color: Colors.black,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: () async {
                            final RenderBox overlay = Overlay.of(context)
                                .context
                                .findRenderObject() as RenderBox;

                            final selected = await showMenu<String>(
                              context: context,
                              position: RelativeRect.fromRect(
                                Rect.fromPoints(
                                  Offset(overlay.size.width - 56,
                                      80), // position near icon, adjust as needed
                                  Offset(overlay.size.width - 16, 120),
                                ),
                                Offset.zero & overlay.size,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16), // Rounded corners here
                              ),
                              items: [
                                PopupMenuItem(
                                  value: 'en',
                                  child: Text('English'),
                                ),
                                PopupMenuItem(
                                  value: 'de',
                                  child: Text('German'),
                                ),
                              ],
                            );

                            if (selected != null) {
                              print('Selected language: $selected');
                              // your language switching logic here
                            }
                          },
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              Assets.icons.language.path,
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 24),

                // Monthly Report Card
                InkWell(
                  onTap: () {
                    context.push(RoutePath.report.addBasePath);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40FFD673), // 25% opacity of #FFD673
                          offset: Offset(0, 2), // X=0, Y=2
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '25 April, 2025',
                              style: AppStyle.roboto12w400C5A5A5A,
                            ),
                            SizedBox(height: 4),
                            Text(
                              AppStrings.monthlyReport,
                              style: AppStyle.roboto16w400C000000,
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Color(0xFF0000000)
                              .withOpacity(0.05), // grey background
                          child: Image.asset(
                            Assets.icons.graph.path,
                            height: 48.h,
                            width: 48.w,
                            // color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Monthly Grocery Spending Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.monthlyGrocerySpending,
                          style: AppStyle.kohSantepheap18w400C000000,
                        ),
                        Text(
                          AppStrings.totalExpenses,
                          style: AppStyle.roboto12w400C80000000,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Your onPressed logic here
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36.h,
                        width: 106.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.yellowFFD673,
                          ), // similar to OutlinedButton border
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.viewBreakdown,
                              style: AppStyle.roboto10w400C000000,
                            ),
                            SizedBox(width: 4),
                            SvgPicture.asset(
                              Assets.icons.forwardView.path,
                              height: 12.h,
                              width: 12.w,
                              color: Color(0xff000000).withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),

                SizedBox(
                  height: 189.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9D976), // yellow highlight
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Image.asset(
                                      Assets.icons.sales.path,
                                      color: Colors.black,
                                      height: 26,
                                      width: 26,
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Image.asset(
                                      Assets.icons.star.path,
                                      height: 26,
                                      width: 26,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.totalSpent,
                                        style: AppStyle.roboto16w500C000000,
                                      ),
                                      Text(
                                        AppStrings.trackTotalSpent,
                                        style: AppStyle.roboto10w500C80000000,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$2800',
                                    style: AppStyle.roboto14w500C000000,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.add,
                                    style: AppStyle.roboto12w400C000000,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Image.asset(
                                      Assets.icons.plus.path,
                                      color: Colors.black,
                                      height: 26,
                                      width: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFFE4DFD7), // yellow highlight
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Image.asset(
                                      Assets.icons.coin.path,
                                      color: Colors.black,
                                      height: 26,
                                      width: 26,
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Image.asset(
                                      Assets.icons.star.path,
                                      height: 26,
                                      width: 26,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.budgetLimit,
                                        style: AppStyle.roboto16w500C000000,
                                      ),
                                      Text(
                                        AppStrings.underBudget,
                                        style: AppStyle.roboto10w500C80000000,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$3000',
                                    style: AppStyle.roboto14w500C000000,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.add,
                                    style: AppStyle.roboto12w400C000000,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Image.asset(
                                      Assets.icons.plus.path,
                                      color: Colors.black,
                                      height: 26,
                                      width: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Recent Purchases horizontal scroll
                Text(
                  AppStrings.recentPurchases,
                  style: AppStyle.kohSantepheap18w400C000000,
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 210.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      purchaseCard(
                        category: 'Dairy',
                        name: 'Milk',
                        price: '\$8.50',
                        imageUrl: Assets.images.dairy.path,
                      ),
                      purchaseCard(
                        category: 'Meat',
                        name: 'Chicken Breast',
                        price: '\$8.50',
                        imageUrl: Assets.images.meat.path,
                      ),
                      purchaseCard(
                        category: 'Vegetables',
                        name: 'Broccoli',
                        price: '\$2.00',
                        imageUrl: Assets.images.brocoli.path,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Purchase History Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.purchaseHistory,
                          style: AppStyle.kohSantepheap18w400C000000,
                        ),
                        Text(
                          AppStrings.itemsYouveBought,
                          style: AppStyle.roboto12w400C80000000,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Your onPressed logic here
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 22.h,
                        width: 69.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.yellowFFD673,
                          ), // similar to OutlinedButton border
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.viewAll,
                              style: AppStyle.roboto12w400C000000,
                            ),
                            SizedBox(width: 4),
                            SvgPicture.asset(
                              Assets.icons.forwardView.path,
                              height: 12.h,
                              width: 12.w,
                              color: Color(0xff000000).withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                // Purchase history list WITHOUT Expanded
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    purchaseHistoryItem(
                        'Milk', 'Dairy', '\$2.50', Assets.icons.milk.path),
                    purchaseHistoryItem(
                        'Bread', 'Bakery', '\$1.80', Assets.icons.bread.path),
                    purchaseHistoryItem(
                        'Apples', 'Fruits', '\$3.00', Assets.icons.apples.path),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
    );
  }

  Widget purchaseCard({
    required String category,
    required String name,
    required String price,
    required String imageUrl,
  }) {
    return Container(
      width: 148.w,
      height: 210.h,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // same radius as parent
            child: SizedBox(
              height: 150.h,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: 6),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              alignment: Alignment.topLeft,
              // padding: EdgeInsets.all(6),
              child: Container(
                height: 24.h,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(8), // match parent container radius
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Text(
                  category,
                  style: AppStyle.roboto12w500C000000,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppStyle.roboto12w400C000000,
                ),
                Text(
                  price,
                  style: AppStyle.roboto16w500C000000,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget purchaseHistoryItem(
    String item,
    String category,
    String price,
    String imageUrl,
  ) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(
            imageUrl,
            height: 24.h,
            width: 24.w,
          ),
          title: Text(
            item,
            style: AppStyle.roboto14w400C000000,
          ),
          subtitle: Text(
            category,
            style: AppStyle.roboto12w400C80000000,
          ),
          trailing: Text(
            price,
            style: AppStyle.roboto14w500C000000,
          ),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        Divider(
          color: Colors.black.withOpacity(0.1),
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
