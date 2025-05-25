import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final int codeLength = 5;
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focusNodes = [];

  bool get isCodeComplete =>
      controllers.every((controller) => controller.text.isNotEmpty);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < codeLength; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    if (value.length > 1) {
      // If user pasted more than 1 character, keep only the first
      controllers[index].text = value[0];
    }
    if (value.isNotEmpty && index < codeLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
    setState(() {});
  }

  void _verifyCode() {
    final code = controllers.map((c) => c.text).join();
    context.push(RoutePath.resetPassConfirm.addBasePath);
  }

  void _resendEmail() {
    // Handle resend email logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Resend email clicked')),
    );
  }

  @override
  Widget build(BuildContext context) {
    const emailText = 'contact@dscode...com';
    const backgroundColor = Color(0xFFF5F1E9);
    const yellowColor = AppColors.primaryColor;
    const grayBorderColor = Color(0xffE1E1E1);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  Assets.icons.arrowBackGrey.path,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Check your email',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              Gap(18.h),

              // make the avobe code using row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              'We sent a reset link to ',
                              style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                color: const Color(0xFF989898),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              emailText,
                              style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                color: const Color(0xFF545454),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Gap(10.h),
                        Text(
                          'Enter the 5-digit code mentioned in the email',
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            color: Color(0xFF989898),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(codeLength, (index) {
                  return Container(
                    width: 56.w,
                    height: 56.h,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      maxLength: 1,
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF545454),
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 45.h),
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: controllers[index].text.isEmpty
                                  ? grayBorderColor
                                  : yellowColor,
                              width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: yellowColor,
                            width: 3,
                          ),
                        ),
                      ),
                      onChanged: (value) => _onCodeChanged(index, value),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isCodeComplete ? _verifyCode : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCodeComplete
                        ? yellowColor
                        : yellowColor.withOpacity(0.4),
                    disabledBackgroundColor: yellowColor.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Verify Code',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haven’t got the email yet? ",
                    style: GoogleFonts.inter(
                      color: Color(0xFF989898),
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        // The text itself
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom:
                                  2), // Adds space between text and underline
                          child: Text(
                            'Resend email', // Your text
                            style: GoogleFonts.inter(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
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
                            color: AppColors
                                .primaryColor, // Color of the underline
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
