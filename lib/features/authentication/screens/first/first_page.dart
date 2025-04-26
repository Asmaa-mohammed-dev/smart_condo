import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_condo/features/authentication/screens/first/second_page.dart';
import 'package:smart_condo/features/authentication/screens/login/login_other/login_other.dart';
import 'package:smart_condo/utils/constants/my_button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية (صورة أو لون)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/121.jpg'), // عدّل المسار حسب صورتك
                fit: BoxFit.cover,
              ),
            ),
          ),

          // المحتوى فوق الخلفية
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.black
                    .withValues(alpha: 0.5), // خلفية شفافة للكلمة والأزرار
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // الكلمة
                  const Text(
                    'SMART CONDO',
                    style: TextStyle(
                      fontSize: 44,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'STENCIL',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // الزرّين
                  Column(
                    children: [
                      MyButton(
                        title: 'المستأجر ',

                        onPressed: () => Get.to(() => const SeconPage()),
                        // أضف التنقل هنا
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                        title: 'المالك ',
                        onPressed: () => Get.to(() => const LoginScreenOther()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
