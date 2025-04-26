import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_condo/data/repositories/authentication.dart';
import 'package:smart_condo/data/repositories/user/user_repository.dart';
import 'package:smart_condo/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:smart_condo/features/authentication/screens/signup.wisgets/signup.dart';
import 'package:smart_condo/navigation_other.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/my_button.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/constants/text_strings.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class NLoginFormOther extends StatefulWidget {
  const NLoginFormOther({super.key});

  @override
  State<NLoginFormOther> createState() => _NLoginFormOtherState();
}

class _NLoginFormOtherState extends State<NLoginFormOther> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: NSizes.spaceBtwSections),
          child: Column(
            children: [
              ///email
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_left),
                  labelText: NTexts.email,
                  hintText: NTexts.email,
                  labelStyle: TextStyle(fontSize: 20),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: NSizes.spaceBtwInputFields),

              ///password
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: NTexts.password,
                  hintText: NTexts.password,
                  labelStyle: TextStyle(fontSize: 20),
                ),
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: NSizes.spaceBtwInputFields / 2),

              ///Remember me
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text(
                        NTexts.rememberMe,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(
                      NTexts.forgetPassword,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],

                ///Forget password
              ),
              SizedBox(height: NSizes.spaceBtwSections),

              MyButton(
                colors: NColors.primary,
                title: NTexts.signIn,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (user != null) {
                      /// 🔽 Get user details from Firestore
                      final userModel =
                          await UserRepository().fetchUserDetails();
                      Get.put<UserModel>(userModel);

                      /// 🔽 Navigate to home
                      Get.offAll(() => NavigationMenuOther());
                    }
                  } catch (e) {
                    print('Login Error: $e');
                    // يمكنك عرض Snackbar هنا عند الخطأ
                  } finally {
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
              ),
              // () => Get.offAll(() => NavigationMenu()

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
                    NTexts.createAccount,
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
    );
  }
}
