import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/core/routes/route_path.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

import '../../../core/custom_assets/assets.gen.dart';

class PasswordResetConfirmScreen extends StatelessWidget {
  const PasswordResetConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // light cream background
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  Assets.icons.arrowBackGrey.path,
                ),
              ),
              Gap(53.h),
              Text(
                AppStrings.passwordReset,
                style: AppStyle.kohSantepheap18w700C1E1E1E,
              ),
              Gap(18.h),
              Text(
                AppStrings.confirmPassword,
                style: AppStyle.roboto14w500C989898,
              ),
              Gap(32.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(RoutePath.resetPass.addBasePath);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7C95C), // yellow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppStrings.confirm,
                    style: AppStyle.inter16w700CFFFFFF,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
