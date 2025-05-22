import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../widgets/custom_bottons/custom_button/slider_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    $AssetsIconsGen icons = Assets.icons;
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                Assets.icons.logo.path,
              ),
            ),
            Gap(28.h),
            Center(
              child: Text(
                AppStrings.appName,
                style: GoogleFonts.robotoSerif(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Gap(97.h),
            Text(
              AppStrings.appTagLine,
              style: GoogleFonts.kohSantepheap(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff404040)),
            ),
            SliderButton(
              onSlideCompleted: () {
                print('Action completed!');
                // Perform your action here
              },
              initialIconPath: Assets.icons.forwardWhite.path,
              completedIconPath: Assets.icons.forwardBlack.path,
              height: 60,
              width: 300,
              activeColor: AppColors.primaryColor,
              inactiveColor: Colors.white,
              buttonColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
