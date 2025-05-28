import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/core/custom_assets/assets.gen.dart';
import 'package:groc_shopy/presentation/widgets/custom_navbar/custom_navbar.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

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
                  style: AppStyle.roboto12w400C000000,
                ),
                const SizedBox(height: 4),
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.profile,
          style: AppStyle.kohSantepheap16w700C3F3F3F,
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
              'Alex Thomson',
              style: AppStyle.kohSantepheap16w700C3F3F3F,
            ),
            const SizedBox(height: 4),
            Text(
              'Manager',
              style: AppStyle.roboto12w400C80000000,
            ),
            const SizedBox(height: 2),
            Text(
              'GastRonomIQ',
              style: AppStyle.robotoSerif12w500C000000,
            ),

            Gap(47.h),
            // Section Title
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.addedReceipt,
                style: AppStyle.kohSantepheap16w700C000000,
              ),
            ),
            Gap(21.h),
            Container(
              width: 349,
              height: 118,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 349,
                      height: 118,
                      decoration: ShapeDecoration(
                        color: AppColors.yellowFFD673,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 81,
                    top: 70,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            AppStrings.upgradeFrom,
                            style: AppStyle.inter14w500C000000,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 56,
                    top: 35,
                    child: SizedBox(
                      width: 236,
                      height: 22,
                      child: Text(
                        AppStrings.unlockExclusiveFeatures,
                        textAlign: TextAlign.center,
                        style: AppStyle.roboto11w400CFFFFFF,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 123,
                    top: 14,
                    child: SizedBox(
                      width: 104,
                      height: 14,
                      child: Text(
                        AppStrings.appName,
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
  final color =
      selected ? AppColors.yellowFFD673 : AppColors.black50opacity80000000;
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
            style: AppStyle.roboto16w700CFFD673,
          ),
          Gap(12.h),
          Container(
            height: selected ? 4.h : 1.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    ),
  );
}
