import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Material(
        child: Container(
          color: AppColors.shape,
          child: Column(
            children: [
              Expanded(
                child: Container(color: Colors.black45),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Text.rich(
                      TextSpan(
                        text: title,
                        style: AppTextStyles.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: '\n$subtitle',
                            style: AppTextStyles.buttonHeading,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.stroke,
                  ),
                  SetLabelButtons(
                    primaryLabel: primaryLabel,
                    enablePrimaryColor: true,
                    primaryOnPressed: primaryOnPressed,
                    secondaryLabel: secondaryLabel,
                    secondaryOnPressed: secondaryOnPressed,
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
