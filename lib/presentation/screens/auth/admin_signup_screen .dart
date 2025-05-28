import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';
import 'package:groc_shopy/utils/text_style/text_style.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/custom_text_form_field/custom_text_form.dart';

class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({super.key});

  @override
  AdminSignUpScreenState createState() => AdminSignUpScreenState();
}

class AdminSignUpScreenState extends State<AdminSignUpScreen> {
  bool isAdmin = true;
  bool rememberMe = false;
  bool passwordVisible = false;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Replace with your own asset path
                  Image.asset(
                    Assets.icons.logo.path,
                    height: 70.h,
                    width: 70.w,
                  ),
                  Gap(16.h),
                  Text(
                    AppStrings.adminSignUp,
                    style: AppStyle.kohSantepheap18w700CFFD673,
                  ),
                  Gap(24.h),
                  // Tab bar for Employee/Admin
                  Container(
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: AppColors.black50opacity80000000,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Gap(42.h),

                  // Email TextField with shadow
                  // _buildTextField(
                  //   controller: fullNameController,
                  //   labelText: AppStrings.fullName,
                  //   hintText: AppStrings.enterYourFullName,
                  //   suffixIconSvg: Assets.icons.fullName,
                  //   obscureText: false,
                  // ),
                  // Gap(35.h),
                  // _buildTextField(
                  //   controller: emailController,
                  //   labelText: AppStrings.email,
                  //   hintText: AppStrings.enterYourEmailHint,
                  //   suffixIcon: Icons.email_outlined,
                  //   obscureText: false,
                  // ),
                  // Gap(35.h),
                  // _buildTextField(
                  //   controller: passwordController,
                  //   labelText: AppStrings.password,
                  //   hintText: AppStrings.passwordHint,
                  //   suffixIcon: passwordVisible
                  //       ? Icons.visibility_outlined
                  //       : Icons.visibility_off_outlined,
                  //   obscureText: !passwordVisible,
                  //   onSuffixIconTap: () {
                  //     setState(() {
                  //       passwordVisible = !passwordVisible;
                  //     });
                  //   },
                  // ),
                  Gap(36.h),
                  CustomTextFormField(
                    controller: fullNameController,
                    labelText: AppStrings.fullName,
                    hintText: AppStrings.enterYourFullName,
                    suffixIconSvgAsset: Assets.icons.fullName
                        .path, // make sure it's a string path to SVG asset
                    obscureText: false,
                    style: AppStyle.roboto14w400C80000000,
                    labelStyle: AppStyle.roboto14w500C000000,
                    enabledBorderColor: AppColors.black30opacity4D000000,
                    focusedBorderColor: AppColors.darkGrayText3F3F3F,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 14),
                  ),

                  Gap(35.h),

                  CustomTextFormField(
                    controller: emailController,
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterYourEmailHint,
                    suffixIcon: Icons.email_outlined,
                    obscureText: false,
                    style: AppStyle.roboto14w400C80000000,
                    labelStyle: AppStyle.roboto14w500C000000,
                    enabledBorderColor: AppColors.black30opacity4D000000,
                    focusedBorderColor: AppColors.darkGrayText3F3F3F,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 14),
                  ),

                  Gap(35.h),

                  CustomTextFormField(
                    controller: passwordController,
                    labelText: AppStrings.password,
                    hintText: AppStrings.passwordHint,
                    suffixIcon: passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    obscureText: !passwordVisible,
                    onSuffixIconTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    style: AppStyle.roboto14w400C80000000,
                    labelStyle: AppStyle.roboto14w500C000000,
                    enabledBorderColor: AppColors.black30opacity4D000000,
                    focusedBorderColor: AppColors.darkGrayText3F3F3F,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 14),
                  ),

                  // Remember Me checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (val) {
                          setState(() {
                            rememberMe = val ?? false;
                          });
                        },
                        activeColor: AppColors.yellowFFD673,
                      ),
                      Text(
                        AppStrings.rememberMe,
                        style: AppStyle.roboto14w400C000000,
                      ),
                    ],
                  ),

                  Gap(33.h),

                  // Sign in button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellowFFD673,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Handle sign in logic here
                      },
                      child: Text(
                        AppStrings.signUp,
                        style: AppStyle.inter16w700CFFFFFF,
                      ),
                    ),
                  ),

                  Gap(15.h),

                  // Sign up and forget password texts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAAccount,
                        style: AppStyle.roboto14w400C000000,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Sign up screen
                          context.push(RoutePath.auth.addBasePath);
                        },
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            // The text itself
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom:
                                      2), // Adds space between text and underline
                              child: Text(
                                AppStrings.signIn, // Your text

                                style: AppStyle.roboto14w500CFFD673,
                              ),
                            ),
                            // The underline with custom gap
                            Positioned(
                              bottom:
                                  0, // Position the underline at the bottom of the text
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 2, // Thickness of the underline
                                color: AppColors
                                    .yellowFFD673, // Color of the underline
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Gap(12.w),

                  Text(
                    AppStrings.or,
                    style: AppStyle.roboto14w500C80000000,
                  ),

                  Gap(12.h),

                  // Social icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(
                        iconPath: Assets.icons.appleSignin.path,
                        onTap: () {
                          // Facebook login
                        },
                      ),
                      Gap(15.w),
                      _buildSocialIcon(
                        iconPath: Assets.icons.google.path,
                        onTap: () {
                          // Google login
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    IconData? suffixIcon,
    SvgGenImage? suffixIconSvg,
    required bool obscureText,
    VoidCallback? onSuffixIconTap,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior:
            FloatingLabelBehavior.always, // Keeps label inside the border

        labelStyle: AppStyle.roboto14w500C000000,
        hintText: hintText,

        hintStyle: AppStyle.roboto14w400C80000000,
        suffixIcon: GestureDetector(
          onTap: onSuffixIconTap,
          child: suffixIconSvg == null
              ? Icon(
                  suffixIcon,
                  color: AppColors.black50opacity80000000,
                  size: 17.h,
                )
              : suffixIconSvg.svg(
                  color: AppColors.black50opacity80000000,
                  height: 17.h,
                  width: 17.h,
                  fit: BoxFit.scaleDown,
                ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            EdgeInsets.fromLTRB(16, 20, 16, 14), // Adjusted padding for label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide:
              BorderSide(color: AppColors.black30opacity4D000000, width: 1.5.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: AppColors.black30opacity4D000000, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide:
              BorderSide(color: AppColors.darkGrayText3F3F3F, width: 1.8.w),
        ),
      ),
    );
  }

  Widget _buildSocialIcon({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        // radius: 35,
        backgroundColor: Colors.transparent,
        child: Image.asset(
          iconPath,
        ),
      ),
    );
  }
}
