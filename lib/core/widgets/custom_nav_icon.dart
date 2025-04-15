import 'package:egb_task/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavIcon extends StatelessWidget {
  final String assetName;
  final bool isActive;

  const CustomNavIcon({
    Key? key,
    required this.assetName,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: 24,
      width: 24,
      color: isActive ? kAccentBlue : kGreyText,
    );
  }
}
