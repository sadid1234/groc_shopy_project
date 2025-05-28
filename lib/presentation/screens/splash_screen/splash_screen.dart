// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:groc_shopy/helper/extension/base_extension.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:groc_shopy/utils/text_style/text_style.dart';

// import '../../../core/custom_assets/assets.gen.dart';
// import '../../../core/routes/route_path.dart';
// import '../../../utils/app_colors/app_colors.dart';
// import '../../widgets/custom_bottons/custom_button/slider_button.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: AppColors.backgroundColor,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Gap(200.h),
//             Center(
//               child: Image.asset(
//                 Assets.icons.logo.path,
//               ),
//             ),
//             Gap(28.h),
//             Center(
//               child: Text(
//                 AppStrings.appName,
//                 style: AppStyle.robotoSerif24w600C000000,
//               ),
//             ),
//             Gap(97.h),
//             Text(
//               AppStrings.appTagLine,
//               style: AppStyle.kohSantepheap24w400C3F3F3F,
//             ),
//             Gap(92.h),
//             SliderButton(
//               onSlideCompleted: () {
//                 context.go(RoutePath.auth.addBasePath);
//               },
//               initialText: AppStrings.getStarted,
//               completedText: AppStrings.welcome,
//               initialIconPath: Assets.icons.forwardWhite.path,
//               completedIconPath: Assets.icons.forwardBlack.path,
//               height: 60.h,
//               width: double.infinity, // Works correctly now
//               activeColor: AppColors.yellowFFD673,
//               inactiveColor: AppColors.whiteFFFFFF,
//               buttonColor: AppColors.whiteFFFFFF,
//               resetAfterCompletion: true,
//               padding: 4.w, // Optional auto-reset
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../widgets/custom_bottons/custom_button/slider_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(200.h),
            Center(
              child: Image.asset(
                Assets.icons.logo.path,
                width: 120.w,
                height: 120.h,
                fit: BoxFit.contain,
              ),
            ),
            Gap(28.h),
            Center(
              child: Text(
                AppStrings.appName,
                style: AppStyle.robotoSerif24w600C000000,
              ),
            ),
            Gap(97.h),
            Text(
              AppStrings.appTagLine,
              style: AppStyle.kohSantepheap24w400C3F3F3F,
            ),
            Gap(92.h),
            SliderButton(
              onSlideCompleted: () {
                context.go(RoutePath.auth.addBasePath);
              },
              initialText: AppStrings.getStarted,
              completedText: AppStrings.welcome,
              initialIconPath: Assets.icons.forwardWhite.path,
              completedIconPath: Assets.icons.forwardBlack.path,
              height: 60.h,
              width: double.infinity,
              activeColor: AppColors.yellowFFD673,
              inactiveColor: AppColors.whiteFFFFFF,
              buttonColor: AppColors.whiteFFFFFF,
              resetAfterCompletion: true,
              padding: 4.w,
            ),
          ],
        ),
      ),
    );
  }
}
