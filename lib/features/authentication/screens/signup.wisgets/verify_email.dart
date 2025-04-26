import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_condo/features/authentication/screens/login/login.dart';
import 'package:smart_condo/features/authentication/screens/login/widgets/success_screen/sucess_screen.dart';
import 'package:smart_condo/features/authentication/screens/signup.wisgets/signup.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';
import 'package:smart_condo/utils/constants/my_button.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/constants/text_strings.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          ///Padding to Give Default Equal on all sides in all screens
          child: Padding(
            padding: EdgeInsets.all(NSizes.defaultSpace),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Image
                Image(
                  image: AssetImage(NImages.deliveredEmailIllustration),
                  width: NHelperFunctions.screenWidth() * 0.7,
                  height: 200,
                ),
                SizedBox(height: NSizes.spaceBtwSections),

                ///Title & SubTitle
                Text(
                  NTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: NSizes.spaceBtwItems - 15),
                Text(
                  'support@help',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: NSizes.spaceBtwSections - 15),
                Text(
                  NTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),

                ///Buttons
                SizedBox(height: NSizes.spaceBtwSections),
                MyButton(
                  colors: NColors.primary,
                  title: NTexts.tContinue,
                  onPressed: () => Get.to(
                    () => SucessScreen(
                      image: NImages.staticSuccessIllustration,
                      title: NTexts.yourAccountCreatedTitle,
                      subTitle: NTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),
                  ),
                ),
                SizedBox(height: NSizes.spaceBtwSections),

                SizedBox(
                  width: double.infinity,
                  height: NSizes.appBarHeight + 10,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // التحكم في الانحناء
                      ),
                    ),
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: Text(
                      NTexts.resendEmail,
                      style: TextStyle(
                        fontSize: 24, // تغيير حجم الخط
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MAJALLA',
                        color: NHelperFunctions.isDarkMode(context)
                            ? NColors.white
                            : NColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
