import 'package:flutter/material.dart';

import 'package:smart_condo/common/styles/widgets.login_signup/form_divider.dart';
import 'package:smart_condo/common/styles/widgets.login_signup/social_buttons.dart';
import 'package:smart_condo/features/authentication/screens/signup.wisgets/signup_form.dart';

import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Title
                Text(
                  NTexts.signUpTitle,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: NSizes.spaceBtwSections),

                ///Form
                const NSignUpForm(),
                const SizedBox(height: NSizes.spaceBtwInputFields),

                ///Divider
                NFormDivider(dividerText: NTexts.orSignInwith),
                const SizedBox(height: NSizes.spaceBtwInputFields),

                ///Buttons
                const NSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
