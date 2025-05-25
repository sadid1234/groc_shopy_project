import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';

import '../../../core/custom_assets/assets.gen.dart';

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
                              style: GoogleFonts.kohSantepheap(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff404040),
                              ),
                            ),
                            Text(
                              'Your grocery expenses at a glance',
                              style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
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
                        Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            Assets.icons.language.path,
                            // color: Colors.black,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 24),

                // Monthly Report Card
                Container(
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
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff5B5B5B),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Monthly Report',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff5B5B5B),
                            ),
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
                SizedBox(height: 24),

                // Monthly Grocery Spending Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monthly Grocery Spending',
                          style: GoogleFonts.kohSantepheap(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Total expenses',
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000).withOpacity(0.5),
                          ),
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
                            color: AppColors.primary,
                          ), // similar to OutlinedButton border
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Breakdown',
                              style: GoogleFonts.roboto(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000).withOpacity(0.5),
                              ),
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
                                        'Total Spent',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Track total spent',
                                        style: GoogleFonts.roboto(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$2800',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Add',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
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
                                        'Budget Limit',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Under budget',
                                        style: GoogleFonts.roboto(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text('\$3000',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Add',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
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
                  'Recent Purchases',
                  style: GoogleFonts.kohSantepheap(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
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
                          'Purchase History',
                          style: GoogleFonts.kohSantepheap(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Items you\'ve bought',
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
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
                            color: AppColors.primary,
                          ), // similar to OutlinedButton border
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View All',
                              style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
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
                    purchaseHistoryItem('Milk', 'Dairy', '\$2.50'),
                    purchaseHistoryItem('Bread', 'Bakery', '\$1.80'),
                    purchaseHistoryItem('Apples', 'Fruits', '\$3.00'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(),
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
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
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
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Text(
                  price,
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget purchaseHistoryItem(String item, String category, String price) {
    IconData icon;
    switch (category.toLowerCase()) {
      case 'dairy':
        icon = Icons.local_drink;
        break;
      case 'bakery':
        icon = Icons.bakery_dining;
        break;
      case 'fruits':
        icon = Icons.apple;
        break;
      default:
        icon = Icons.shopping_bag;
    }

    return ListTile(
      leading: Image.asset(
        Assets.icons.milk.path,
        height: 24.h,
        width: 24.w,
      ),
      title: Text(item),
      subtitle: Text(category),
      trailing: Text(price),
      dense: true,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;
  final List<String> icons = [
    Assets.icons.home.path,
    Assets.icons.scan.path,
    Assets.icons.transaction.path,
    Assets.icons.profile.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // Replace 62.h if you use ScreenUtil
      decoration: BoxDecoration(
        color: Color(0xFF282F291A).withOpacity(0.1),
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.all(0),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isSelected ? 150 : 65, // expanded width for selected
              height: 65,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFFFD54F) : Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(isSelected ? 25 : 50),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icons[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
