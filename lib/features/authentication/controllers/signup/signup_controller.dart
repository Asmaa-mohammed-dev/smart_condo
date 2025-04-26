import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_condo/common/loaders/network_management.dart';
import 'package:smart_condo/data/repositories/authentication.dart';
import 'package:smart_condo/data/repositories/user/user_repository.dart';
import 'package:smart_condo/features/authentication/screens/signup.wisgets/verify_email.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';
import 'package:smart_condo/utils/popups/full_screen_loader.dart';
import 'package:smart_condo/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///Sign Up

  void signup() async {
    try {
      ///Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', NImages.google);

      ///check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      ///Form validation
      if (!signupFormKey.currentState!.validate()) return;

      ///Privacy policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy.');
        return;
      }

      ///Register user in the Firebase Authentication & Save user data in the firebase
      final user = await AuthenticationRepository.instance
          .registterWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      ///save Authenticated User data in the firebase firestore
      final newUser = UserModel(
          id: user.user!.uid,
          username: userName.text.trim(),
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserData(newUser);
      Get.put<UserModel>(newUser);

      TFullScreenLoader.stoploading();

      ///show Success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created successfully.');

      ///Move to Verify email Screen
      Get.to(
        () => const VerifyEmailScreen(),
      );
      Get.put<UserModel>(newUser);
      // Get.offAll(() => const VerifyEmailScreen());

      ///
    } catch (e) {
      TFullScreenLoader.stoploading();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

      ///Show some generic error to the user
    }
  }
}
