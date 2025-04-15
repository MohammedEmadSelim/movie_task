import 'package:egb_task/core/constants/icons.dart';
import 'package:egb_task/core/responsive/dimension.dart';
import 'package:egb_task/core/theme/colors.dart';
import 'package:egb_task/core/widgets/custom_btn_widget.dart';
import 'package:egb_task/core/widgets/custom_svg.dart';
import 'package:egb_task/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

void customShowDialog({
  required BuildContext context,
  required String text,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return Center(
        child: FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(anim1),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0.r),
            ),
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  color: kDarkInputBackground,
                  borderRadius: BorderRadius.circular(30.0.r),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.h,
                      backgroundColor: kRed.withAlpha(300),
                      child: ClipOval(
                        child: CustomSvgImage(
                          image: AppIcons.errorIcon,
                          color: kRed,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: CustomText(
                        maxLines: 3,
                        text: text,
                        textColor: kWhite,
                        // Use your blackColor variable here
                        fontSizes: 18
                            .sp, // Adjust this to use your sp variable if needed
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    // SizedBox(height: 10.h),
                    CustomButtonWidget(
                        backgroundColor: kDarkBackgroundColor,
                        verticalConstraint: 0,
                        textColor: kWhite,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        width: MediaQuery.of(context).size.width,
                        title: 'back'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return FadeTransition(
        opacity: anim1,
        child: child,
      );
    },
  );
}
