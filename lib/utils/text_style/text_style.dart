import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors/app_colors.dart';

class AppTextStyles {
  static final heading1 = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: AppColors.darkGrey,
  );

  static final heading2 = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColors.darkGrey,
  );

  static final body = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.black,
  );

  static final label = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: AppColors.black,
  );

  static final hint = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.black.withOpacity(0.5),
  );

  static final button = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.white,
  );

  static final link = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.primary,
  );
}
