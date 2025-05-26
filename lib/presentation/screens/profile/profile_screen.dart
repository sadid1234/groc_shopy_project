import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/core/custom_assets/assets.gen.dart';
import 'package:groc_shopy/presentation/widgets/custom_navbar/custom_navbar.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isTotal = true;
  late TabController _tabController;
  final Color darkGray = Color(0xFF858585);
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
    },
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
    },
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
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Image.asset(
              receipt['image'],
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receipt['store'],
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Items: ${receipt['items']}',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Text(
            receipt['price'],
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use a network image or local asset for the banner and profile photo.
    // example profile

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.profile,
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
            child: const Icon(Icons.logout_outlined),
          ),
        ],
        leadingWidth: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header with banner and profile pic
            Gap(20),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 350.w,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: AssetImage(Assets.images.brocoli.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 55,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage:
                          AssetImage(Assets.images.profileImage.path),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Tomas Alen',
              style: GoogleFonts.kohSantepheap(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Employee',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Groc Shopy',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),

            Gap(47.h),
            // Section Title
            Align(
              alignment: Alignment.center,
              child: Text(
                'Added Receipt',
                style: GoogleFonts.kohSantepheap(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
              ),
            ),
            Gap(21.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoleTab(AppStrings.recently, !isTotal, () {
                  setState(() {
                    isTotal = false;
                  });
                }),
                _buildRoleTab(AppStrings.total, isTotal, () {
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
                  // Recently tab list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: isTotal ? total.length : recently.length,
                      itemBuilder: (context, index) {
                        return receiptItem(
                            isTotal ? total[index] : recently[index]);
                      },
                    ),
                  ),
                  // Total tab placeholder
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
  final primaryYellow = AppColors.primaryColor;
  final black50 = Colors.black.withOpacity(0.5);

  final color = selected ? primaryYellow : black50;
  final fontWeight = selected ? FontWeight.bold : FontWeight.normal;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: 175.w, // fixed width to align underline and text nicely
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
              fontSize: 16.sp,
              color: color,
            ),
          ),
          Gap(12.h),
          Container(
            height: selected ? 4.h : 1.h,
            decoration: BoxDecoration(
              color: selected ? primaryYellow : black50,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    ),
  );
}
