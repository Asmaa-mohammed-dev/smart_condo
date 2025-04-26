import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_condo/features/authentication/controllers/signup/signup_controller.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/constants/text_strings.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class NTermsAndConditionCheckbox extends StatelessWidget {
  const NTermsAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = NHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        SizedBox(height: NSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${NTexts.isAgreeTo}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: '${NTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? NColors.textWhite : NColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? NColors.white : NColors.primary),
              ),
              TextSpan(
                text: '${NTexts.and} ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: '${NTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? NColors.textWhite : NColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? NColors.white : NColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
