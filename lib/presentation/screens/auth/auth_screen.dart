import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/core/routes/routes.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  bool isAdmin = true;
  bool rememberMe = false;
  bool passwordVisible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryYellow = AppColors.primaryColor;
    final bgColor = AppColors.backgroundColor;
    final black50 = Colors.black.withOpacity(0.5);

    return Scaffold(
      backgroundColor: bgColor,
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
                  Gap(15.h),
                  Text(
                    AppStrings.signIn,
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gap(25.h),
                  // Tab bar for Employee/Admin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRoleTab(AppStrings.employee, !isAdmin, () {
                        setState(() {
                          isAdmin = false;
                        });
                      }),
                      _buildRoleTab(AppStrings.admin, isAdmin, () {
                        setState(() {
                          isAdmin = true;
                        });
                      }),
                    ],
                  ),
                  Gap(45.h),

                  // Email TextField with shadow
                  _buildTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    suffixIcon: Icons.email_outlined,
                    obscureText: false,
                  ),
                  Gap(35.h),
                  _buildTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: '********',
                    suffixIcon: passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    obscureText: !passwordVisible,
                    onSuffixIconTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  Gap(6.73.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        context.push(RoutePath.forgotPass.addBasePath);
                      },
                      child: Text(
                        AppStrings.forgotPassword,
                        style: GoogleFonts.roboto(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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
                        activeColor: primaryYellow,
                      ),
                      Text(
                        AppStrings.rememberMe,
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
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
                        backgroundColor: primaryYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Handle sign in logic here
                      },
                      child: Text(
                        AppStrings.signIn,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
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
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(RoutePath.adminSignUp.addBasePath);
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
                                AppStrings.signUp, // Your text
                                style: GoogleFonts.roboto(
                                  color: primaryYellow,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
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
                                color: primaryYellow, // Color of the underline
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Gap(28.w),

                  Text(
                    AppStrings.or,
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),

                  Gap(31.h),

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

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData suffixIcon,
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
        labelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          color: Colors.black,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(
            0.5,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: onSuffixIconTap,
          child: Icon(
            suffixIcon,
            color: Colors.black.withOpacity(0.5),
            size: 17.h,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            EdgeInsets.fromLTRB(16, 20, 16, 14), // Adjusted padding for label
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.3), width: 1.5.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.3), width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1.8.w),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(
      {required String iconPath, required VoidCallback onTap}) {
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
