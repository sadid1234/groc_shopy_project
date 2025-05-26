import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/core/custom_assets/assets.gen.dart';
import 'package:groc_shopy/presentation/widgets/custom_navbar/custom_navbar.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';

class TransactionHistoryScreen extends StatelessWidget {
  TransactionHistoryScreen({super.key});
  final Color backgroundColor = Color(0xFFF8F4ED);
  final Color accentColor = AppColors.primaryColor;
  final Color lightGray = Color(0xFFD9D9D9);
  final Color darkGray = Color(0xFF858585);

  final List<TransactionGroup> transactions = [
    TransactionGroup(
      date: 'Today, 14 May, 2025',
      total: 1060,
      items: [
        TransactionItem(
          title: 'Dairy',
          subtitle: 'Today',
          amount: 120,
          icon: Assets.icons.dairy.path,
        ),
        TransactionItem(
          title: 'Meat',
          subtitle: 'Today',
          amount: 800,
          icon: Assets.icons.meat.path,
        ),
        TransactionItem(
          title: 'Vegetables',
          subtitle: 'Today',
          amount: 140,
          icon: Assets.icons.vegetables.path,
        ),
      ],
    ),
    TransactionGroup(
      date: 'Yesterday, 13 May, 2025',
      total: 500,
      items: [
        TransactionItem(
          title: 'Fruits',
          subtitle: 'Yesterday',
          amount: 66,
          icon: Assets.icons.fruits.path,
        ),
        TransactionItem(
          title: 'Drinks',
          subtitle: 'Yesterday',
          amount: 300,
          icon: Assets.icons.drinks.path,
        ),
        TransactionItem(
          title: 'Plates',
          subtitle: 'Yesterday',
          amount: 134,
          icon: Assets.icons.plates.path,
        ),
      ],
    ),
    TransactionGroup(
      date: 'Yesterday, 13 May, 2025',
      total: 500,
      items: [
        TransactionItem(
          title: 'Packaging',
          subtitle: 'Yesterday',
          amount: 66,
          icon: Assets.icons.packaging.path,
        ),
        TransactionItem(
          title: 'Drinks',
          subtitle: 'Yesterday',
          amount: 300,
          icon: Assets.icons.drinks.path,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Transaction History',
          style: GoogleFonts.kohSantepheap(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xff404040),
            letterSpacing: 0.8,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.more_horiz,
              color: darkGray,
              size: 24,
            ),
          ),
        ],
        leadingWidth: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Total Spending Card
            Container(
              width: double.infinity,
              height:
                  82, // if you are using .h from a package like flutter_screenutil, keep it, otherwise just 82
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFFD673).withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Spending',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: darkGray,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$1920',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: accentColor,
                    ),
                  ),
                ],
              ),
            ),
            // Export & Download Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _smallButton('Export'),
                SizedBox(width: 8),
                _smallButton('Download'),
              ],
            ),
            // SizedBox(height: 12),
            // Transaction List
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final group = transactions[index];
                  return _buildTransactionGroup(group);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, bool selected) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: selected
          ? BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(14),
            )
          : null,
      child: Icon(
        icon,
        size: 24,
        color: selected ? Colors.black : Colors.black45,
      ),
    );
  }

  Widget _smallButton(String label) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.7),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _buildTransactionGroup(TransactionGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: lightGray,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: EdgeInsets.only(top: 7.h),
          child: Row(
            children: [
              Text(
                group.date,
                style: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Spacer(),
              Text(
                '\$${group.total}',
                style: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: accentColor,
                ),
              ),
            ],
          ),
        ),
        ...group.items.map((item) => _buildTransactionItem(item)).toList(),
      ],
    );
  }

  Widget _buildTransactionItem(TransactionItem item) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: Color(0xFFF2F2F2),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(4),
            child: SvgPicture.asset(
              item.icon,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                item.subtitle,
                style: GoogleFonts.roboto(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            '\$${item.amount}',
            style: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionGroup {
  final String date;
  final int total;
  final List<TransactionItem> items;

  TransactionGroup({
    required this.date,
    required this.total,
    required this.items,
  });
}

class TransactionItem {
  final String title;
  final String subtitle;
  final int amount;
  final String icon;

  TransactionItem(
      {required this.title,
      required this.subtitle,
      required this.amount,
      required this.icon});
}
