import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/utilts/fontSizer.dart';
import 'package:egb_task/core/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    this.title,
    this.child,
    required this.onTap,
    this.backgroundColor,
    this.width,
    this.borderRadius,
    this.height,
    this.textColor,
    this.verticalConstraint,
    super.key,
    this.border,
  });

  final Widget? child;
  final String? title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? verticalConstraint;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalConstraint ?? 26.h),
      child: TapEffect(
        onClick: onTap,
        child: Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 40.h,
          decoration: BoxDecoration(
            border: border,
            color: backgroundColor ,
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          ),
          child: Center(
              child: child ??
                  Text(title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: textColor ?? kWhite,
                        fontSize: FontSizer.s13,
                      ))),
        ),
      ),
    );
  }
}
