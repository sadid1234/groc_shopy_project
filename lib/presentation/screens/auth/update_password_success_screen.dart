import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

import '../../../core/routes/route_path.dart';

class UpdatePasswordSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light beige background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circle with checkmark icon
              Container(
                width: 98.w,
                height: 98.h,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5FF),
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFFDD472), width: 2),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Color(0xFFFDD472),
                    size: 40,
                  ),
                ),
              ),
              Gap(31.h),
              // White card container
              Container(
                height: 230.h,
                width: 380.w,
                padding: EdgeInsets.all(22.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.successful,
                      style: AppStyle.robotoSerif20w600C1E1E1E,
                    ),
                    Gap(24.h),
                    Text(
                      AppStrings.congratulations,
                      style: AppStyle.roboto16w500C989898,
                      textAlign: TextAlign.center,
                    ),
                    Gap(33.h),
                    SizedBox(
                      width: 268.w,
                      height: 44.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push(RoutePath.auth.addBasePath);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF7C95C), // yellow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          AppStrings.updatePassword,
                          style: AppStyle.inter16w700CFFFFFF,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
