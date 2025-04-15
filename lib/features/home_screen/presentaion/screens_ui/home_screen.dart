import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/widgets/custom_text.dart';
import 'package:egb_task/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          CustomText(
            text: 'What do you want to watch?',
            textColor: kWhite,
            fontSizes: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextField(
            focusNode: searchFocusNode,
            hint: 'Search',
            controller: searchController,
          ),
        ],
      ),
    );
  }
}
