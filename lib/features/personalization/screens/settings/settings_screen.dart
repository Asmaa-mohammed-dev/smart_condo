import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/common/custom_shape/container/primary_header_container.dart';
import 'package:smart_condo/common/texts/section_heading.dart';
import 'package:smart_condo/common/widgets/list_tile/list_tile.dart';
import 'package:smart_condo/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:smart_condo/features/personalization/screens/adresses/address.dart';
import 'package:smart_condo/features/personalization/screens/settings/bank_account/banks.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            NPrimaryHeaderContainer(
              child: Column(
                children: [
                  NAppBar(
                    title: Text(
                      'حسابي',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MAJALLA',
                        fontSize: 21,
                        color: NColors.white,
                      ),
                    ),
                    showBackArrow: true,
                  ),
                  NUserProfileTitle(),
                  SizedBox(height: NSizes.spaceBtwSections),
                ],
              ),
            ),
            //Body
            Padding(
              padding: EdgeInsets.all(NSizes.defaultSpace),
              child: Column(
                children: [
                  //Account Settings
                  NsectionHeading(
                    title: 'إعدادات الحساب',
                    showActionButton: false,
                  ),

                  SizedBox(height: NSizes.spaceBtwItems),
                  NSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'العنوان',
                    subtitle: 'تحديد عنوان المنزل',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),

                  NSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'الحساب البنكي',
                    subtitle: 'ألغي حسابك البنكي أو أدخل حساب جديد',
                    onTap: () => Get.to(() => const UserBankScreen()),
                  ),

                  NSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'الاشعارات',
                    subtitle: 'قم بتحديد أي من رسائل الاشعارات',
                    onTap: () {},
                  ),
                  NSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'خصوصية الحساب',
                    subtitle: 'قم بإدراة استخدام بياناتك وحساباتك المرتبطة',
                    onTap: () {},
                  ),
                  // NSettingMenuTile(
                  //   icon: Icons.settings,
                  //   title: 'الإعدادات العامة',
                  //   subtitle: 'في التقدم والأوردرات المكتملة',
                  //   onTap: () {},
                  // ),

                  //App Settings
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
