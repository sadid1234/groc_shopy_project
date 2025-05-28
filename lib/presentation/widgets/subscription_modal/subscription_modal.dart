import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

class SubscriptionModal extends StatelessWidget {
  const SubscriptionModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.subscriptionModalBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    AppStrings.skip,
                    style: AppStyle.inter16w500C6A4DFF,
                  ),
                ),
              ),
              Gap(8.h),
              Text(
                AppStrings.getUnlimitedAccess,
                style: AppStyle.kohSantepheap20w700C090A0A,
                textAlign: TextAlign.center,
              ),
              Gap(12.h),
              Text(
                AppStrings.takeTheFirstStep,
                style: AppStyle.roboto12w400C090A0A,
                textAlign: TextAlign.center,
              ),
              Gap(24.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.popular,
                      style: AppStyle.inter12w400C090A0A,
                    ),
                    Gap(4.h),
                    Text(
                      AppStrings.forMoreScan,
                      style: AppStyle.roboto16w700C090A0A,
                    ),
                    Gap(8.h),
                    Text(
                      '\$60.99',
                      style: AppStyle.roboto40w700C090A0A,
                    ),
                    Gap(4.h),
                    Text(
                      AppStrings.forOneYear,
                      style: AppStyle.inter12w400C090A0A,
                    ),
                    Gap(16.h),
                    Text(
                      AppStrings.unlimitedAccessTosSan,
                      style: AppStyle.inter14w400C090A0A,
                      textAlign: TextAlign.center,
                    ),
                    Gap(20.h),
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellowFFD673,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                        onPressed: () {
                          // Handle subscribe logic
                        },
                        child: Text(
                          AppStrings.subscribe,
                          style: AppStyle.inter16w500White,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Text(
                AppStrings.youWillBe,
                style: AppStyle.inter12w400C090A0A,
                textAlign: TextAlign.center,
              ),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
