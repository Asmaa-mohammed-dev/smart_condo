import 'package:flutter/material.dart';
import 'package:smart_condo/features/authentication/screens/login/login.dart';

class SeconPage extends StatelessWidget {
  const SeconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SMART CONDO',
            style: TextStyle(
              fontSize: 44,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'STENCIL',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            // خلفية صورة
            Positioned.fill(
              child: Image.asset(
                'assets/images/121.jpg', // بدليها بالصورة اللي عندك
                fit: BoxFit.cover,
              ),
            ),

            // المحتوى فوق الخلفية
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  12.0, 100.0, 12.0, 12.0), // padding من فوق علشان الأب بار
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: buildLinkedContainer(
                        context,
                        'assets/images/212.png',
                        'التسجيل\n كفرد',
                        const LoginScreen(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: buildLinkedContainer(
                        context,
                        'assets/images/31.jpg',
                        'التسجيل كمنشأة',
                        const LoginScreen(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: buildLinkedContainer(
                        context,
                        'assets/images/32.jpg',
                        'التسجيل كجهة حكومية',
                        const LoginScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLinkedContainer(
      BuildContext context, String imagePath, String text, Widget targetPage) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            // الصورة - نصف العرض مع حواف ناعمة
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),

            // النص - نصف العرض مع خلفية ملونة ونص في المنتصف
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 157, 116, 240),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                      color: Colors.white,
                      fontSize: 33,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
