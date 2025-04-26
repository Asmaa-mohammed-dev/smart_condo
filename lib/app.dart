import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_condo/bindings/general_bindings.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/theme/theme.dart';

//To do : Add widgets bindings
//To do : Init Local Storage
//To do : Await Native Splash
//To do : Initialize firebase
//To do : Initialize authentication

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: NAppTheme.lightTheme,
        darkTheme: NAppTheme.darkTheme,
        // home: const OnBoardingScreen(),
        initialBinding: GeneralBindings(),
        home: const Scaffold(
          backgroundColor: NColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white)),
        ),
      ),
    );
  }
}
