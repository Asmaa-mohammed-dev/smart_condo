import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/features/authentication/screens/favorite/favorite_screen.dart';
import 'package:smart_condo/features/authentication/screens/favorite/problem_list_screen.dart';
import 'package:smart_condo/features/personalization/screens/chats/contact_other.dart';
import 'package:smart_condo/features/personalization/screens/home/widgets/home_screen_other.dart';
import 'package:smart_condo/features/personalization/screens/rent/rent_screen_other.dart';
import 'package:smart_condo/features/personalization/screens/settings/settings_screen.dart';

class NavigationMenuOther extends StatelessWidget {
  const NavigationMenuOther({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationControllerOther());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'الرئيسية',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.money_2),
                label: 'الإيجار',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.heart),
                label: 'المقترحات',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.message),
                label: 'المحادثات',
              ),
              NavigationDestination(icon: Icon(Icons.menu), label: 'المزيد'),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class NavigationControllerOther extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreenOther(),
    const RentScreenOther(),
    const ProblemsListScreen(),
    ContactsScreenOther(),
    const SettingsScreen(),
  ];
}
