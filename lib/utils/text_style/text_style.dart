import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // import ScreenUtil
import '../app_colors/app_colors.dart';

class AppTextStyles {
  // --------------------
  // Base Roboto Styles
  // --------------------
  static final roboto10w400 =
      GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w400);
  static final roboto12w400 =
      GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w400);
  static final roboto12w500 =
      GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w500);
  static final roboto14w400 =
      GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final roboto14w500 =
      GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static final roboto16w400 =
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w400);
  static final roboto16w500 =
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500);
  static final roboto16w600 =
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w600);
  static final roboto16w700 =
      GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static final roboto24w600 =
      GoogleFonts.roboto(fontSize: 24.sp, fontWeight: FontWeight.w600);

  // Roboto Variants
  static final roboto10w400Black50opacity = roboto10w400.copyWith(
    color: AppColors.black50opacity80000000,
    height: 1.8,
    letterSpacing: 0.5,
  );

  static final roboto12w400Black50opacity = roboto12w400.copyWith(
    color: AppColors.black50opacity80000000,
    height: 1.33,
  );

  static final roboto12w400Black = roboto12w400.copyWith(
    color: AppColors.black000000,
    height: 0.83,
  );

  static final roboto12w400Black70opacity = roboto12w400.copyWith(
    color: AppColors.black70opacityB2000000,
    height: 1.33,
  );

  static final roboto12w500Black = roboto12w500.copyWith(
    color: AppColors.black000000,
    height: 1.33,
    letterSpacing: -0.5,
  );

  static final roboto14w400Black50opacity = roboto14w400.copyWith(
    color: AppColors.black50opacity80000000,
    height: 1.43,
  );

  static final roboto14w400Black = roboto14w400.copyWith(
    color: AppColors.black000000,
    height: 1.33,
  );

  static final roboto14w500Black = roboto14w500.copyWith(
    color: AppColors.black000000,
    height: 1.43,
  );

  static final roboto14w500Yellow = roboto14w500.copyWith(
    color: AppColors.yellowFFD673,
    height: 1.43,
  );

  static final roboto14w500Black50opacity = roboto14w500.copyWith(
    color: AppColors.black50opacity80000000,
  );

  static final roboto14w500Black50opacityWithLetterSpacing =
      roboto14w500.copyWith(
    color: AppColors.black50opacity80000000,
    letterSpacing: -0.5,
  );

  static final roboto14w400Black50opacityLetterSpacing = roboto14w400.copyWith(
    color: AppColors.black50opacity80000000,
    letterSpacing: -0.5,
  );

  static final roboto14w400Black50opacityLetterSpacingLarge =
      roboto14w400.copyWith(
    color: AppColors.black50opacity80000000,
    letterSpacing: 7.56,
  );

  static final roboto16w600DarkGray = roboto16w600.copyWith(
    color: AppColors.blackTextDarkGray2A2A2A,
    height: 1.25,
    letterSpacing: -0.5,
  );

  static final roboto16w500Black = roboto16w500.copyWith(
    color: AppColors.black000000,
    height: 1.12,
  );

  static final roboto16w700Black50opacity = roboto16w700.copyWith(
    color: AppColors.black50opacity80000000,
  );

  static final roboto24w600Black = roboto24w600.copyWith(
    color: AppColors.black000000,
    height: 0.92,
  );

  // --------------------
  // Base Roboto Serif Styles
  // --------------------
  static final robotoSerif20w600 =
      GoogleFonts.robotoSerif(fontSize: 20.sp, fontWeight: FontWeight.w600);
  static final robotoSerif24w600 =
      GoogleFonts.robotoSerif(fontSize: 24.sp, fontWeight: FontWeight.w600);

  // Roboto Serif Variants
  static final robotoSerif20w600Black = robotoSerif20w600.copyWith(
    color: AppColors.blackText1E1E1E,
    height: 1,
    letterSpacing: -0.5,
  );

  static final robotoSerif24w600Black = robotoSerif24w600.copyWith(
    color: AppColors.black000000,
    height: 0.92,
  );

  // --------------------
  // Base Inter Styles
  // --------------------
  static final inter12w500 =
      GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500);
  static final inter14w400 =
      GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final inter14w500 =
      GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static final inter14w600 =
      GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600);
  static final inter16w400 =
      GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400);
  static final inter16w700 =
      GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static final inter16w800 =
      GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w800);

  // Inter Variants
  static final inter12w500Black70opacity = inter12w500.copyWith(
    color: AppColors.black70opacityB2000000,
    height: 1.83,
  );

  static final inter14w400Black90opacity = inter14w400.copyWith(
    color: AppColors.black90opacityE5000000,
    height: 1.57,
  );

  static final inter14w500Yellow = inter14w500.copyWith(
    color: AppColors.yellowFFD673,
    height: 1.43,
  );

  static final inter14w600YellowUnderline = inter14w600.copyWith(
    color: AppColors.yellowFFD673,
    decoration: TextDecoration.underline,
    height: 1.43,
    letterSpacing: -0.5,
  );

  static final inter14w600MediumGrey = inter14w600.copyWith(
    color: AppColors.mediumGreyText989898,
    height: 1.43,
    letterSpacing: -0.5,
  );

  static final inter14w600BlackDarkGray = inter14w600.copyWith(
    color: AppColors.blackTextDarkGray2A2A2A,
    height: 1.43,
    letterSpacing: -0.5,
  );

  static final inter16w700Black = inter16w700.copyWith(
    color: AppColors.black000000,
    height: 1.38,
  );

  static final inter16w700White = inter16w700.copyWith(
    color: AppColors.whiteFFFFFF,
    height: 1.25,
  );

  static final inter16w800Yellow = inter16w800.copyWith(
    color: AppColors.yellowFFD673,
  );

  // --------------------
  // Base Koh Santepheap Styles
  // --------------------
  static final kohSantepheap10w400 =
      GoogleFonts.kohSantepheap(fontSize: 10.sp, fontWeight: FontWeight.w400);
  static final kohSantepheap14w400 =
      GoogleFonts.kohSantepheap(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final kohSantepheap16w700 =
      GoogleFonts.kohSantepheap(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static final kohSantepheap18w400 =
      GoogleFonts.kohSantepheap(fontSize: 18.sp, fontWeight: FontWeight.w400);
  static final kohSantepheap18w700 =
      GoogleFonts.kohSantepheap(fontSize: 18.sp, fontWeight: FontWeight.w700);
  static final kohSantepheap20w700 =
      GoogleFonts.kohSantepheap(fontSize: 20.sp, fontWeight: FontWeight.w700);
  static final kohSantepheap24w400 =
      GoogleFonts.kohSantepheap(fontSize: 24.sp, fontWeight: FontWeight.w400);

  // Koh Santepheap Variants
  static final kohSantepheap16w700Black = kohSantepheap16w700.copyWith(
    color: AppColors.darkGrayText3F3F3F,
    height: 0.62,
  );

  static final kohSantepheap18w400Black = kohSantepheap18w400.copyWith(
    color: AppColors.black000000,
    height: 1.11,
  );

  static final kohSantepheap18w700Yellow = kohSantepheap18w700.copyWith(
    color: AppColors.yellowFFD673,
    height: 1.11,
    letterSpacing: -0.5,
  );

  static final kohSantepheap24w400Dark = kohSantepheap24w400.copyWith(
    color: AppColors.darkText090A0A,
    height: 1.67,
  );

  static final kohSantepheap18w700Dark = kohSantepheap18w700.copyWith(
    color: AppColors.darkText090A0A,
    height: 1.11,
    letterSpacing: -0.5,
  );

  static final kohSantepheap20w700Dark = kohSantepheap20w700.copyWith(
    color: AppColors.darkText090A0A,
    height: 1.11,
    letterSpacing: -0.5,
  );

  static final kohSantepheap18w700Black = kohSantepheap18w700.copyWith(
    color: AppColors.black000000,
    height: 1.11,
    letterSpacing: -0.5,
  );

  // --------------------
  // Base Poppins Style
  // --------------------
  static final poppins18w600 =
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600);

  static final poppins18w600DarkGrey = poppins18w600.copyWith(
    color: AppColors.darkGreyText545454,
    height: 1.11,
    letterSpacing: -0.5,
  );
  static final poppins16w500 =
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500);

  static final poppins18w600DarkGrey = poppins16w500.copyWith(
    color: AppColors.darkGreyText545454,
    height: 1.11,
    letterSpacing: -0.5,
  );

  // --------------------
  // Custom Styles (composed from base)
  // --------------------

  // GastRonomIQ TextStyle (Roboto Serif, 24sp, w600, black, height 0.92)
  static final gastRonomIQTextStyle = robotoSerif24w600Black;

  // Track items TextStyle (Koh Santepheap, 24sp, w400, #3F3F3F, height 1.67)
  static final trackItemsTextStyle = kohSantepheap24w400Dark;

  // Employee (Inter, 16, w700, black with 50% opacity)
  static final employeeText = inter16w700Black.copyWith(
    color: AppColors.black50opacity80000000,
  );

  // Admin (Inter, 16, w800, #FFD673)
  static final adminText = inter16w800Yellow;

  // Enter your email (Roboto, 14, w400, black 50% opacity)
  static final enterEmailText = roboto14w400Black50opacity;

  // Password obscured '********' (Roboto, 14, w400, black 50%, letterSpacing 7.56)
  static final passwordObscuredText =
      roboto14w400Black50opacityLetterSpacingLarge;

  // Label Email (Roboto, 14, w500, black)
  static final labelEmailText = roboto14w500Black;

  // Sign in button text (Inter, 16, w700, white)
  static final signInButtonText = inter16w700White;

  // Forget password? (Roboto, 14, w500, #FFD673)
  static final forgetPasswordText = roboto14w500Yellow;

  // Remember me (Roboto, 14, w400, black)
  static final rememberMeText =
      roboto14w400.copyWith(color: AppColors.black000000);

  // Or (Roboto, 14, w500, black 50%)
  static final orText = roboto14w500.copyWith(
    color: AppColors.black50opacity80000000,
  );

  // Sign up (Roboto, 14, w500, #FFD673)
  static final signUpText = roboto14w500Yellow;

  // Don’t have an account? (Roboto, 14, w400, black)
  static final dontHaveAccountText =
      roboto14w400.copyWith(color: AppColors.black000000);

  // Password label (Roboto, 14, w500, black)
  static final passwordLabelText = roboto14w500Black;

  // Your Email (Roboto, 16, w600, #2A2A2A, height 1.25, letterSpacing -0.5)
  static final yourEmailText = roboto16w600.copyWith(
    color: AppColors.blackTextDarkGray2A2A2A,
    height: 1.25,
    letterSpacing: -0.5,
  );

  // Please enter your email ... (Roboto, 14, w600, #989898, height 1.43, letterSpacing -0.5)
  static final enterEmailDescriptionText = roboto14w500.copyWith(
    color: AppColors.mediumGreyText989898,
    height: 1.43,
    letterSpacing: -0.5,
  );

  // Forgot password (Koh Santepheap, 18, w700, #1E1E1E, height 1.11, letterSpacing -0.5)
  static final forgotPasswordTextKoh = kohSantepheap18w700.copyWith(
    color: AppColors.blackText1E1E1E,
    height: 1.11,
    letterSpacing: -0.5,
  );

  // Reset Password button text (Inter, 16, w700, white, height 1.25, letterSpacing -0.5)
  static final resetPasswordButtonText = inter16w700White;

  // Contact email (Roboto, 16, w500, #545454, height 1.25, letterSpacing -0.5)
  static final contactEmailText = roboto16w500.copyWith(
    color: AppColors.darkGreyText545454,
    height: 1.25,
    letterSpacing: -0.5,
  );

  // "We sent a reset link to " (Roboto, 14, w500, #989898)
  static final resetLinkInfoText = roboto14w500.copyWith(
    color: AppColors.mediumGreyText989898,
    height: 1.43,
    letterSpacing: -0.5,
  );

  // "contact@dscode...com" (Roboto, 14, w600, #545454)
  static final resetLinkEmailText = roboto14w500.copyWith(
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreyText545454,
    height: 1.43,
    letterSpacing: -0.5,
  );

  // Check your email (Koh Santepheap, 18, w700, #1E1E1E)
  static final checkEmailText = kohSantepheap18w700.copyWith(
    color: AppColors.blackText1E1E1E,
    height: 1.11,
    letterSpacing: -0.5,
  );

  // Verify Code button text (Inter, 16, w700, white)
  static final verifyCodeButtonText = inter16w700White;

  // "Haven’t got the email yet?" (Inter, 14, w600, #989898)
  static final emailNotReceivedText = inter14w600.copyWith(
    color: AppColors.mediumGreyText989898,
    height: 1.43,
    letterSpacing: -0.5,
  );

  // "Resend email" (Inter, 14, w600, #FFD673, underline)
  static final resendEmailText = inter14w600YellowUnderline;

  // Digits (Poppins, 18, w600, #545454)
  static final digitText = poppins18w600DarkGrey;

  // Your password reset message (Roboto, 14, w500, #989898, height 1.79)
  static final passwordResetMessage = roboto14w500.copyWith(
    color: AppColors.mediumGreyText989898,
    height: 1.79,
  );

  // Password reset title (Koh Santepheap, 18, w700, #1E1E1E, height 1.11, letterSpacing -0.5)
  static final passwordResetTitle = kohSantepheap18w700.copyWith(
    color: AppColors.blackText1E1E1E,
    height: 1.11,
    letterSpacing: -0.5,
  );

  // Confirm button text (Inter, 16, w700, white, height 1.25, letterSpacing -0.5)
  static final confirmButtonText = inter16w700White;

  // Create a new password (Roboto, 14, w500, #989898)
  static final createNewPasswordText = roboto14w500.copyWith(
    color: AppColors.mediumGreyText989898,
  );

  // Set a new password (Koh Santepheap, 18, w700, #1E1E1E)
  static final setNewPasswordTitle = kohSantepheap18w700.copyWith(
    color: AppColors.blackText1E1E1E,
    height: 1.11,
    letterSpacing: -0.5,
  );

  // Update Password button text (Inter, 16, w700, white)
  static final updatePasswordButtonText = inter16w700White;

  // Password label (Roboto, 16, w600, #2A2A2A)
  static final passwordLabelText16 = roboto16w600.copyWith(
    color: AppColors.blackTextDarkGray2A2A2A,
    height: 1.25,
    letterSpacing: -0.5,
  );

  // Confirm Password label (Roboto, 16, w600, #2A2A2A)
  static final confirmPasswordLabelText = passwordLabelText16;

  // Enter your new password (Roboto, 14, w500, #B3B3B3)
  static final enterNewPasswordText = roboto14w500.copyWith(
    color: AppColors.lightGreyTextB3B3B3,
    height: 1.43,
    letterSpacing: -0.5,
  );

  // Re-enter password (Roboto, 14, w500, #B3B3B3)
  static final reEnterPasswordText = enterNewPasswordText;

  // Successful (Roboto Serif, 20, w600, #1E1E1E)
  static final successfulText = robotoSerif20w600Black;

  // Congratulations message (Inter, 16, w500, #989898)
  static final congratsMessage = inter14w600MediumGrey.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
  );

  // Alex Thomson (Koh Santepheap, 16, w700, #3F3F3F, height 0.62)
  static final alexThomson = kohSantepheap16w700Black;

  // Your grocery expenses at a glance (Roboto, 12, w400, black 50%, height 1.33)
  static final groceryExpenses = roboto12w400Black50opacity;

  // Date text (Roboto, 12, w400, #5A5A5A, height 0.83)
  static final dateText = roboto12w400.copyWith(
    color: AppColors.darkGreyText545454,
    height: 0.83,
  );

  // Monthly Report (Roboto, 16, w400, black, height 0.62)
  static final monthlyReport = roboto16w400.copyWith(
    height: 0.62,
  );

  // Total Spent / Budget Limit (Roboto, 16, w500, black, height ~1.12)
  static final labelText = roboto16w500Black;

  // Track total spent / Under budget (Roboto, 10, w500, black 50%, height 1.8)
  static final subLabelText = roboto10w400Black50opacity.copyWith(height: 1.8);

  // Price Text (Roboto, 14, w500, black, height ~1.14)
  static final priceText = roboto14w500Black.copyWith(height: 1.14);

  // Add button text (Roboto, 12, w400, black, height 1.33)
  static final addButtonText = roboto12w400Black.copyWith(height: 1.33);

  // Monthly Grocery Spending title (Koh Santepheap, 18, w400, black, height 1.33)
  static final monthlyGroceryTitle =
      kohSantepheap18w400Black.copyWith(height: 1.33);

  // Total expenses label (Roboto, 12, w400, black 50%, height 1.33)
  static final totalExpensesLabel =
      roboto12w400Black50opacity.copyWith(height: 1.33);

  // View Breakdown (Roboto, 10, w400, black, height 1.6)
  static final viewBreakdownText = roboto10w400.copyWith(
    color: AppColors.black000000,
    height: 1.6,
  );

  // Purchase History title (Koh Santepheap, 18, w400, black, height 1.33)
  static final purchaseHistoryTitle =
      kohSantepheap18w400Black.copyWith(height: 1.33);

  // Items you've bought (Roboto, 12, w400, black 50%, height 1.33)
  static final itemsBoughtText = totalExpensesLabel;

  // Item name (Roboto, 14, w400, black, height 1.43)
  static final itemNameText = roboto14w400Black.copyWith(height: 1.43);

  // Item category (Roboto, 12, w400, black 50%, height 1.33)
  static final itemCategoryText = totalExpensesLabel;

  // Item price (Roboto, 16, w500, black, height 1.5)
  static final itemPriceText = roboto16w500Black.copyWith(height: 1.5);

  // Emoji style for icons (Roboto, 20, w400, black, height 1.6)
  static final emojiStyle = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black000000,
    height: 1.6,
  );

  // Grocery Items title (Koh Santepheap, 16, w700, black, height 1, letterSpacing 0.8)
  static final groceryItemsTitle = kohSantepheap16w700Black.copyWith(
    height: 1,
    letterSpacing: 0.8,
  );

  // Recent Scans title (Roboto, 14, w500, black, height 1.14, letterSpacing 0.7)
  static final recentScansTitle = roboto14w500Black.copyWith(
    height: 1.14,
    letterSpacing: 0.7,
  );

  // Fresh Milk, Chicken, Artichoke, Broccoli, Meat item titles (Roboto, 14, w400, black, height 0.86, letterSpacing 0.7)
  static final itemName = roboto14w400Black.copyWith(
    height: 0.86,
    letterSpacing: 0.7,
  );

  // Dates (Roboto, 10, w400, black 50%, height 1.20, letterSpacing 0.5)
  static final itemDate = roboto10w400Black50opacity.copyWith(
    height: 1.20,
    letterSpacing: 0.5,
  );

  // Prices (Roboto, 10, w400, #FFD673, height 1.6, letterSpacing 0.5)
  static final itemPrice = roboto10w400.copyWith(
    color: AppColors.yellowFFD673,
    height: 1.6,
    letterSpacing: 0.5,
  );

  // Processed badge text (Roboto, 8, w500, black, height 2, letterSpacing 0.4)
  static final processedBadgeText = GoogleFonts.roboto(
    fontSize: 8.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black000000,
    height: 2,
    letterSpacing: 0.4,
  );

  // Edit button text (Inter, 14, w500, black 90%, height 1.57)
  static final editButtonText = inter14w500.copyWith(
    color: AppColors.black90opacityE5000000,
    height: 1.57,
  );

  // Save button text (Inter, 14, w700, white, height 1.57)
  static final saveButtonText = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteFFFFFF,
    height: 1.57,
  );

  // Transaction History title (Koh Santepheap, 16, w700, black, height 1, letterSpacing 0.8)
  static final transactionHistoryTitle = kohSantepheap16w700Black.copyWith(
    height: 1,
    letterSpacing: 0.8,
  );

  // Amount large (Roboto, 24, w500, #FFD673, height 0.67, letterSpacing 1.2)
  static final amountLarge = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.yellowFFD673,
    height: 0.67,
    letterSpacing: 1.2,
  );

  // Date small (Roboto, 12, w600, black 50%, height 1, letterSpacing 0.6)
  static final dateSmall = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black50opacity80000000,
    height: 1,
    letterSpacing: 0.6,
  );

  // Amount small (Roboto, 12, w600, #FFD673, height 1, letterSpacing 0.6)
  static final amountSmall = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.yellowFFD673,
    height: 1,
    letterSpacing: 0.6,
  );

  // Total Spending label (Roboto, 16, w600, black 50%, height 0.75, letterSpacing 0.8)
  static final totalSpendingLabel = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black50opacity80000000,
    height: 0.75,
    letterSpacing: 0.8,
  );

  // Transaction item title (Roboto, 16, w400, black, height 0.75, letterSpacing 0.8)
  static final transactionItemTitle = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black000000,
    height: 0.75,
    letterSpacing: 0.8,
  );

  // Transaction item date (Roboto, 10, w400, black 50%, height 1.2, letterSpacing 0.5)
  static final transactionItemDate = roboto10w400Black50opacity.copyWith(
    height: 1.2,
    letterSpacing: 0.5,
  );

  // Transaction item amount (Roboto, 16, w500, #FFD673, height 1, letterSpacing 0.8)
  static final transactionItemAmount = roboto16w500.copyWith(
    color: AppColors.yellowFFD673,
    height: 1,
    letterSpacing: 0.8,
  );

  // Export/Download button text (Inter, 12, w500, black 70%, height 1.83)
  static final buttonText = inter12w500Black70opacity;
}
