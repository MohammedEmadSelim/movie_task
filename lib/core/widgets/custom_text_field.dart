import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/utilts/fontSizer.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.focusNode,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.maxLine,
    this.readOnly,
    this.obscureText = false,
    this.width,
    this.height,
    this.backGroundColor,
    this.radiusCircular,
    this.showShadow,
    this.minLines,
    this.searchIcon,
    this.onTap,
    this.isDisabled,
    this.validator,
    this.onPressedPassword,
    this.obscureTextHideIcon,
    Key? key,
    this.suffix,
    this.label,
    this.enableBorder = false,
    this.hitStyle,
    this.style,
  }) : super(key: key);

  final Widget? suffix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLine;
  final int? minLines;
  final int? maxLength;
  final String? hint;
  final String? label;
  final Function? onChanged;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final bool? isDisabled;
  final bool? readOnly;
  final bool? obscureText;
  final bool? obscureTextHideIcon;
  final double? width;
  final double? height;
  final Color? backGroundColor;
  final double? radiusCircular;
  final bool? showShadow;
  final bool? searchIcon;
  final VoidCallback? onTap;
  final Function? validator;
  final VoidCallback? onPressedPassword;
  final bool? enableBorder;
  final TextStyle? hitStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: width,
      child: TextFormField(
        cursorColor: kGreyText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textInputAction: TextInputAction.done,
        focusNode: focusNode,
        controller: controller,
        validator: (value) => validator == null ? null : validator!(value),
        onChanged: (v) => onChanged == null ? null : onChanged!(v),
        onTap: onTap,
        style: style ?? TextStyle(color: kGreyText, fontSize: 15),
        minLines: minLines,
        maxLength: maxLength,
        maxLines: maxLine ?? 1,
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: backGroundColor ?? kDarkInputBackground,
          hintText: hint ?? "",
          hintStyle: hitStyle ??
              TextStyle(
                fontSize: 14,
                color: kGreyText.withOpacity(0.6),
              ),
          prefixIcon: searchIcon == true
              ? Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(Icons.search, color: kGreyText),
          )
              : null,
          suffixIcon: suffix,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusCircular ?? 20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusCircular ?? 20),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusCircular ?? 20),
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(fontSize: 12, height: 0),
          labelStyle: TextStyle(fontSize: 15, color: kGreyText),
          counterText: "",
        ),
      ),
    );
  }
}
