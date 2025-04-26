import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/features/authentication/controllers/signup/signup_controller.dart';
import 'package:smart_condo/features/authentication/screens/signup.wisgets/terms_conditions_checkbox.dart';
import 'package:smart_condo/utils/constants/my_button.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/constants/text_strings.dart';
import 'package:smart_condo/utils/validators/validation.dart';

class NSignUpForm extends StatelessWidget {
  const NSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    labelText: NTexts.firstName,
                    hintText: NTexts.firstName,
                    labelStyle: TextStyle(fontSize: 20),
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: NSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: NTexts.lastName,
                    hintText: NTexts.lastName,
                    labelStyle: TextStyle(fontSize: 20),
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                TValidator.validateEmptyText('User Name', value),
            expands: false,
            decoration: InputDecoration(
              labelText: NTexts.username,
              hintText: NTexts.username,
              labelStyle: TextStyle(fontSize: 20),
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              labelText: NTexts.email,
              hintText: NTexts.email,
              labelStyle: TextStyle(fontSize: 20),
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              labelText: NTexts.phoneNo,
              hintText: NTexts.phoneNo,
              labelStyle: TextStyle(fontSize: 20),
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: NSizes.spaceBtwInputFields),

          ///Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => TValidator.validatePassword(value),
              expands: false,
              decoration: InputDecoration(
                labelText: NTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: NSizes.spaceBtwInputFields),

          ///Terms & conditions
          const NTermsAndConditionCheckbox(),
          const SizedBox(height: NSizes.spaceBtwInputFields),

          ///SignUp button
          SizedBox(
            width: double.infinity,
            child: MyButton(
              onPressed: () => controller.signup(),
              title: NTexts.createAccount,
            ),
          ),
        ],
      ),
    );
  }
}
