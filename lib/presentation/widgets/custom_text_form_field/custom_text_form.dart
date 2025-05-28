import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // If you use SVG icons

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final IconData? suffixIcon;
  final String? suffixIconSvgAsset;
  final bool obscureText;
  final VoidCallback? onSuffixIconTap;
  final TextInputType keyboardType;
  final int? maxLength;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color fillColor;
  final bool filled;
  final BorderRadius? borderRadius;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final double enabledBorderWidth;
  final double focusedBorderWidth;
  final bool showCounter;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.suffixIconSvgAsset,
    this.obscureText = false,
    this.onSuffixIconTap,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.focusNode,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.contentPadding,
    this.fillColor = Colors.white,
    this.filled = true,
    this.borderRadius,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.enabledBorderWidth = 1.5,
    this.focusedBorderWidth = 1.8,
    this.showCounter = true,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    if (widget.onSuffixIconTap == null) {
      setState(() {
        _obscureText = !_obscureText;
      });
    } else {
      widget.onSuffixIconTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(12);

    Widget? suffixIconWidget;
    if (widget.suffixIconSvgAsset != null) {
      suffixIconWidget = GestureDetector(
        onTap: widget.onSuffixIconTap,
        child: SvgPicture.asset(
          widget.suffixIconSvgAsset!,
          height: 17,
          width: 17,
          color: Colors.black.withOpacity(0.5),
        ),
      );
    } else if (widget.suffixIcon != null) {
      suffixIconWidget = GestureDetector(
        onTap: _toggleObscureText,
        child: Icon(
          widget.suffixIcon,
          color: Colors.black.withOpacity(0.5),
          size: 17,
        ),
      );
    }

    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      focusNode: widget.focusNode,
      style: widget.style,
      decoration: InputDecoration(
        labelText: widget.labelText,
        floatingLabelBehavior: widget.labelText != null
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.never,
        labelStyle: widget.labelStyle,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        suffixIcon: suffixIconWidget,
        filled: widget.filled,
        fillColor: widget.fillColor,
        contentPadding: widget.contentPadding,
        counterText: widget.showCounter ? null : '',
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: widget.enabledBorderColor,
            width: widget.enabledBorderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: widget.enabledBorderColor,
            width: widget.enabledBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: widget.focusedBorderColor,
            width: widget.focusedBorderWidth,
          ),
        ),
      ),
    );
  }
}
