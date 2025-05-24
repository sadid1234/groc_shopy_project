import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE9E1D5)),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // light cream background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  Assets.icons.arrowBackGrey.path,
                ),
              ),
              Gap(53.h),
              // Title
              Text(
                'Set a new password',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Color(0xFF1E1E1E), // dark grey
                ),
              ),
              Gap(18.h),
              Text(
                'Create a new password. Ensure it differs from\nprevious ones for security',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: Color(0xFF989898), // dark grey
                ),
              ),
              Gap(44.h),
              // Password Field
              Text(
                'Password',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xFF2A2A2A), // dark grey
                ),
              ),
              Gap(8.h),
              TextField(
                style: GoogleFonts.poppins(
                  color: Color(0xff545454),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Enter your new password",
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xffB3B3B3),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  // border: inputBorder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.dg),
                    borderSide: BorderSide(
                        color: AppColors.textFieldBorderResetColor,
                        width: 1.5.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: AppColors.textFieldBorderResetColor,
                        width: 1.5.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.dg),
                    borderSide: BorderSide(
                        color: AppColors.textFieldBorderResetColor,
                        width: 1.8.w),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              Gap(16.h),
              // Confirm Password Field
              Text(
                'Confirm Password',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xFF2A2A2A), // dark grey
                ),
              ),
              Gap(8.h),
              TextField(
                style: GoogleFonts.poppins(
                  color: Color(0xff545454),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: "Re-enter password",
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xffB3B3B3),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.dg),
                    borderSide: BorderSide(
                        color: AppColors.textFieldBorderResetColor,
                        width: 1.5.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: AppColors.textFieldBorderResetColor,
                        width: 1.5.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.dg),
                    borderSide: BorderSide(
                        color: AppColors.textFieldBorderResetColor,
                        width: 1.8.w),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Update Password Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(RoutePath.resetPasswordSuccess.addBasePath);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7C95C), // yellow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Update Password',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
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
