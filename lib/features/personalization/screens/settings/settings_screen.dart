import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/common/custom_shape/container/primary_header_container.dart';
import 'package:smart_condo/common/texts/section_heading.dart';
import 'package:smart_condo/common/widgets/list_tile/list_tile.dart';
import 'package:smart_condo/common/widgets/list_tile/setting_menu_tile.dart';
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
                    onTap: () {},
                  ),

                  // NSettingMenuTile(
                  //   icon: Iconsax.shopping_cart,
                  //   title: 'حقيبة التسوق',
                  //   subtitle: ' أضف، أحذف منتجات وانتقل لعملية الدف',
                  //   onTap: () {},
                  // ),
                  NSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'الحساب البنكي',
                    subtitle: 'ألغي حسابك البنكي أو أدخل حساب جديد',
                    onTap: () {},
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
                  NSettingMenuTile(
                    icon: Icons.settings,
                    title: 'الإعدادات العامة',
                    subtitle: 'في التقدم والأوردرات المكتملة',
                    onTap: () {},
                  ),

                  //App Settings
                  SizedBox(height: NSizes.spaceBtwSections),
                  NsectionHeading(
                    title: 'إعدادات التطبيق',
                    showActionButton: false,
                  ),
                  SizedBox(height: NSizes.spaceBtwItems),
                  NSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'البيانات المحلية',
                    subtitle: "قم بتحميل الداتا على حسابك على فايربيز",
                  ),
                  NSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'الموقع',
                    subtitle: "قم بتحديد مقترحات طبقًا لموقعك",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  NSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'الوضع الأمن',
                    subtitle: "قم بالبحث في وضع آمن لجميع الفئات العمرية",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  NSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'صور بجودة HD',
                    subtitle: "تحديد جودة الصورة لتصبح مرئية",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  //Logout Button
                  SizedBox(height: NSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'الخروج',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: NColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
