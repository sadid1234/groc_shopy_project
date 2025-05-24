import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      final isNotEmpty = emailController.text.isNotEmpty;
      if (isNotEmpty != isButtonEnabled) {
        setState(() {
          isButtonEnabled = isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF5EFE6);
    const buttonColor = AppColors.primaryColor;
    const inputBackgroundColor = Color(0xFFFAF7F2);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
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
              const SizedBox(height: 30),
              Text(
                'Forgot password',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your email to reset the password',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Email',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                style: GoogleFonts.poppins(
                  color: Color(0xff545454),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: inputBackgroundColor,
                  hintText: AppStrings.enterYourEmailHint,
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xffB3B3B3),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          context.push(RoutePath.verification.addBasePath);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    disabledBackgroundColor: buttonColor.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
