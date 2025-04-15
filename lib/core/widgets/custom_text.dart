import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.height,
      this.overFlowText,
      this.fontSizes,
      this.decoration});

  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? height;
  final TextOverflow? overFlowText;
  final double? fontSizes;
  final TextDecoration? decoration;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        maxLines: widget.maxLines,
        textAlign: widget.textAlign,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
            fontWeight: widget.fontWeight,
            color: widget.textColor ?? kGreyText,
            fontSize: widget.fontSizes ?? 15.sp,
            height: widget.height,
            decoration: widget.decoration,
            ));
  }
}
