import 'package:flutter/material.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/common/custom_shape/container/n_rounded_container.dart';
import 'package:smart_condo/common/texts/section_heading.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';
import 'package:smart_condo/utils/constants/sizes.dart';

class RentScreen extends StatelessWidget {
  const RentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            Column(
              children: [
                //Appbar
                NAppBar(
                  title: Text(
                    'الإيجار',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MAJALLA',
                      fontSize: 27,
                    ),
                  ),
                  showBackArrow: true,
                ),
                //searchbar
                Padding(
                  padding: const EdgeInsets.only(right: NSizes.defaultSpace),
                ),
              ],
            ),
            //Home
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: NSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            AssetImage(
                              NImages.money1,
                            ), // استخدام صورة من الأصول
                            size: 24, // حجم الأيقونة
                          ),
                        ],
                      ),
                      SizedBox(width: NSizes.spaceBtwItems),
                      NsectionHeading(
                        title: 'الإيجار',
                        onPressed: () {},
                        showActionButton: false,
                      ),
                    ],
                  ),
                  //Rent Container
                  SizedBox(height: NSizes.spaceBtwItems),
                  NRoundedContainer(
                    backgroundColor: const Color(0xFF5C509A),
                    height: 219,
                    padding: const EdgeInsets.only(top: NSizes.sm),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: NSizes.spaceBtwItems),
                            NsectionHeading(
                              title: 'الإيجار',
                              onPressed: () {},
                              textColor: NColors.white,
                              showActionButton: false,
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Center(
                              child: NRoundedContainer(
                                backgroundColor: const Color(0xFFA373E9),
                                height: 180,
                                padding: const EdgeInsets.all(NSizes.sm),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            'إجمالي المبلغ',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'MAJALLA',
                                              fontSize: 21,
                                              color: NColors.white,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,

                                          child: Text(
                                            '1000 ريال سعودي',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'MAJALLA',
                                              fontSize: 21,
                                              color: NColors.white,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,

                                          child: Text(
                                            "موعد سداد الإيجار : 10/4/2025م",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'MAJALLA',
                                              fontSize: 15,
                                              color: NColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: NSizes.spaceBtwItems),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            AssetImage(
                              NImages.activity1,
                            ), // استخدام صورة من الأصول
                            size: 24, // حجم الأيقونة
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: NSizes.spaceBtwItems),
                          NsectionHeading(
                            title: 'الأنشطة',
                            onPressed: () {},
                            textColor: NColors.black,
                            showActionButton: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: NSizes.spaceBtwItems),
                  NRoundedContainer(
                    backgroundColor: const Color(0xFFA373E9),
                    height: 50,
                    padding: const EdgeInsets.only(top: NSizes.sm),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: NSizes.spaceBtwItems),
                            NsectionHeading(
                              title: 'أقترب موعد سداد الإيجار.',
                              onPressed: () {},
                              textColor: NColors.white,
                              showActionButton: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: NSizes.spaceBtwItems),

                  NRoundedContainer(
                    backgroundColor: const Color(0xFFA373E9),
                    height: 50,
                    padding: const EdgeInsets.only(top: NSizes.sm),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: NSizes.spaceBtwItems),
                            NsectionHeading(
                              title: 'تحدث المالك عن صيانة الاسانسير',
                              onPressed: () {},
                              textColor: NColors.white,
                              showActionButton: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: NSizes.spaceBtwItems),
                  NRoundedContainer(
                    backgroundColor: Colors.transparent,
                    height: 150,

                    child: Center(
                      child: Image.asset(
                        NImages.house,
                        fit:
                            BoxFit
                                .contain, // أو BoxFit.cover لو حابة تملأ المساحة
                        height: 150,
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
}
