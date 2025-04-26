import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_condo/common/custom_shape/container/n_rounded_container.dart';
import 'package:smart_condo/common/custom_shape/container/primary_header_container.dart';
import 'package:smart_condo/common/custom_shape/container/search_container.dart';
import 'package:smart_condo/common/texts/section_heading.dart';
import 'package:smart_condo/features/personalization/screens/home/widgets/home_appbar.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class HomeScreenOther extends StatefulWidget {
  const HomeScreenOther({super.key});

  @override
  _HomeScreenOtherState createState() => _HomeScreenOtherState();
}

class _HomeScreenOtherState extends State<HomeScreenOther> {
  TextEditingController rentController = TextEditingController(text: "1000");
  TextEditingController dateController =
      TextEditingController(text: "10/4/2025");
  TextEditingController activityController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                  NHomeAppBar(),
                  SizedBox(height: NSizes.spaceBtwSections),
                  NSearchContainer(text: 'أبحث عن ............', onTap: () {}),
                  SizedBox(height: NSizes.spaceBtwSections - 15),
                  Padding(
                    padding: const EdgeInsets.only(right: NSizes.defaultSpace),
                    child: Column(
                      children: [],
                    ),
                  ),
                  SizedBox(height: NSizes.spaceBtwSections),
                ],
              ),
            ),
            // Home
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace),
              child: Column(
                children: [
                  // الإيجار Section
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(NHelperFunctions.isDarkMode(context)
                            ? NImages.money1
                            : NImages.money2),
                        size: 24,
                      ),
                      SizedBox(width: NSizes.spaceBtwItems),
                      NsectionHeading(
                        title: 'الإيجار',
                        onPressed: () {},
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.black),
                        onPressed: () {
                          _showEditDialog();
                        },
                      ),
                    ],
                  ),
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
                                            '${rentController.text} ريال سعودي',
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
                                            "موعد سداد الإيجار : ${dateController.text}",
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

                  // الأنشطة Section
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(NHelperFunctions.isDarkMode(context)
                            ? NImages.activity1
                            : NImages.activity2),
                        size: 24,
                      ),
                      SizedBox(width: NSizes.spaceBtwItems),
                      NsectionHeading(
                        title: 'الأنشطة',
                        onPressed: () {},
                        textColor: NHelperFunctions.isDarkMode(context)
                            ? NColors.white
                            : NColors.black,
                        showActionButton: false,
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
                              title: 'تحدث المالك عن صيانة المصعد',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the dialog for editing rent and date
  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text("تعديل الإيجار وموعد السداد"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: rentController,
                  decoration: InputDecoration(
                    labelText: "الإيجار",
                    hintText: "أدخل قيمة الإيجار",
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: "موعد السداد",
                    hintText: "أدخل موعد السداد",
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("إلغاء"),
              ),
              TextButton(
                onPressed: () {
                  _updateRentInFirestore();
                  Navigator.of(context).pop();
                },
                child: Text("تم"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateRentInFirestore() {
    _firestore.collection('rent').doc('currentRent').set({
      'amount': rentController.text,
      'dueDate': dateController.text,
    });
    // تحديث القيمة المعروضة في الواجهة بعد التغيير
    setState(() {
      // يمكن هنا تحديث القيمة الظاهرة داخل الواجهة
      // سيتم استخدام rentController.text لأنه يحتوي على القيمة الجديدة
    });
  }
}
