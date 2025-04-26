import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_condo/common/styles/spacing_styles.dart';
import 'package:smart_condo/common/styles/widgets.login_signup/form_divider.dart';
import 'package:smart_condo/common/styles/widgets.login_signup/social_buttons.dart';
import 'package:smart_condo/features/authentication/screens/login/login_other/login_other_form.dart';
import 'package:smart_condo/features/authentication/screens/login/widgets/login_form.dart';
import 'package:smart_condo/features/authentication/screens/login/widgets/login_header.dart';

import 'package:smart_condo/utils/constants/sizes.dart';

import 'package:smart_condo/utils/constants/text_strings.dart';

class LoginScreenOther extends StatefulWidget {
  const LoginScreenOther({super.key});

  @override
  State<LoginScreenOther> createState() => _LoginScreenOtherState();
}

class _LoginScreenOtherState extends State<LoginScreenOther> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: NSpacingStyle.paddingAppBarHeight,
            child: Column(
              children: [
                ///Logo ,title,subtitle
                Align(alignment: Alignment.centerRight, child: NLoginHeader()),

                ///Form
                NLoginFormOther(),

                ///Divider
                NFormDivider(dividerText: NTexts.orSignInwith),
                SizedBox(height: NSizes.spaceBtwSections),

                ///Footer
                NSocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
