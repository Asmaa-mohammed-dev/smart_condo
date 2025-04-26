// import 'package:flutter/material.dart';
// import 'package:smart_condo/common/custom_shape/container/n_rounded_container.dart';
// import 'package:smart_condo/common/custom_shape/container/primary_header_container.dart';
// import 'package:smart_condo/common/custom_shape/container/search_container.dart';
// import 'package:smart_condo/common/texts/section_heading.dart';
// import 'package:smart_condo/features/personalization/screens/home/widgets/home_appbar.dart';
// import 'package:smart_condo/utils/constants/colors.dart';
// import 'package:smart_condo/utils/constants/image_strings.dart';
// import 'package:smart_condo/utils/constants/sizes.dart';
// import 'package:smart_condo/utils/helpers/helper_functions.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String rentAmount = '1000 ريال سعودي'; // قيمة الإيجار
//   String rentDueDate = '10/4/2025م'; // تاريخ سداد الإيجار

//   // دالة لتغيير قيمة الإيجار وتاريخ السداد
//   void updateRentDetails(String newAmount, String newDate) {
//     setState(() {
//       rentAmount = newAmount;
//       rentDueDate = newDate;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //Header
//             NPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   //Appbar
//                   NHomeAppBar(),
//                   SizedBox(height: NSizes.spaceBtwSections),
//                   //searchbar
//                   NSearchContainer(text: 'أبحث عن ............', onTap: () {}),
//                   //heading
//                   SizedBox(height: NSizes.spaceBtwSections - 15),
//                   Padding(
//                     padding: const EdgeInsets.only(right: NSizes.defaultSpace),
//                     child: Column(
//                       children: [],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwSections),
//                 ],
//               ),
//             ),
//             //Home
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: NSizes.defaultSpace,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ImageIcon(
//                             AssetImage(
//                               NHelperFunctions.isDarkMode(context)
//                                   ? NImages.money1
//                                   : NImages.money2,
//                             ), // استخدام صورة من الأصول
//                             size: 24, // حجم الأيقونة
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: NSizes.spaceBtwItems),
//                       NsectionHeading(
//                         title: 'الإيجار',
//                         onPressed: () {},
//                         showActionButton: false,
//                       ),
//                     ],
//                   ),
//                   //Rent Container
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   NRoundedContainer(
//                     backgroundColor: const Color(0xFF5C509A),
//                     height: 219,
//                     padding: const EdgeInsets.only(top: NSizes.sm),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(width: NSizes.spaceBtwItems),
//                             NsectionHeading(
//                               title: 'الإيجار',
//                               onPressed: () {},
//                               textColor: NColors.white,
//                               showActionButton: false,
//                             ),
//                           ],
//                         ),
//                         Stack(
//                           children: [
//                             Center(
//                               child: NRoundedContainer(
//                                 backgroundColor: const Color(0xFFA373E9),
//                                 height: 180,
//                                 padding: const EdgeInsets.all(NSizes.sm),
//                                 child: Stack(
//                                   children: [
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.topRight,
//                                           child: Text(
//                                             'إجمالي المبلغ',
//                                             textAlign: TextAlign.right,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'MAJALLA',
//                                               fontSize: 21,
//                                               color: NColors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             rentAmount, // استخدام القيمة المتغيرة
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'MAJALLA',
//                                               fontSize: 21,
//                                               color: NColors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             "موعد سداد الإيجار : $rentDueDate", // استخدام القيمة المتغيرة
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'MAJALLA',
//                                               fontSize: 15,
//                                               color: NColors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   Row(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ImageIcon(
//                             AssetImage(
//                               NHelperFunctions.isDarkMode(context)
//                                   ? NImages.activity1
//                                   : NImages.activity2,
//                             ), // استخدام صورة من الأصول
//                             size: 24, // حجم الأيقونة
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(width: NSizes.spaceBtwItems),
//                           NsectionHeading(
//                             title: 'الأنشطة',
//                             onPressed: () {},
//                             textColor: NHelperFunctions.isDarkMode(context)
//                                 ? NColors.white
//                                 : NColors.black,
//                             showActionButton: false,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   NRoundedContainer(
//                     backgroundColor: const Color(0xFFA373E9),
//                     height: 50,
//                     padding: const EdgeInsets.only(top: NSizes.sm),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(width: NSizes.spaceBtwItems),
//                             NsectionHeading(
//                               title: 'أقترب موعد سداد الإيجار.',
//                               onPressed: () {},
//                               textColor: NColors.white,
//                               showActionButton: false,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   NRoundedContainer(
//                     backgroundColor: const Color(0xFFA373E9),
//                     height: 50,
//                     padding: const EdgeInsets.only(top: NSizes.sm),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(width: NSizes.spaceBtwItems),
//                             NsectionHeading(
//                               title: 'تحدث المالك عن صيانة المصعد',
//                               onPressed: () {},
//                               textColor: NColors.white,
//                               showActionButton: false,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:smart_condo/common/custom_shape/container/n_rounded_container.dart';
// import 'package:smart_condo/common/custom_shape/container/primary_header_container.dart';
// import 'package:smart_condo/common/custom_shape/container/search_container.dart';
// import 'package:smart_condo/common/texts/section_heading.dart';
// import 'package:smart_condo/features/personalization/screens/home/widgets/home_appbar.dart';
// import 'package:smart_condo/utils/constants/colors.dart';
// import 'package:smart_condo/utils/constants/image_strings.dart';
// import 'package:smart_condo/utils/constants/sizes.dart';
// import 'package:smart_condo/utils/helpers/helper_functions.dart';

// class HomeScreen extends StatefulWidget {
//   final String rentAmount;
//   final String rentDueDate;
//   const HomeScreen(
//       {super.key, required this.rentAmount, required this.rentDueDate});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String rentAmount = '1000 ريال سعودي'; // قيمة الإيجار
//   String rentDueDate = '10/4/2025م'; // تاريخ سداد الإيجار

//   // دالة لتغيير قيمة الإيجار وتاريخ السداد
//   void updateRentDetails(String newAmount, String newDate) {
//     setState(() {
//       rentAmount = newAmount;
//       rentDueDate = newDate;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //Header
//             NPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   //Appbar
//                   NHomeAppBar(),
//                   SizedBox(height: NSizes.spaceBtwSections),
//                   //searchbar
//                   NSearchContainer(text: 'أبحث عن ............', onTap: () {}),
//                   //heading
//                   SizedBox(height: NSizes.spaceBtwSections - 15),
//                   Padding(
//                     padding: const EdgeInsets.only(right: NSizes.defaultSpace),
//                     child: Column(
//                       children: [],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwSections),
//                 ],
//               ),
//             ),
//             //Home
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: NSizes.defaultSpace,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ImageIcon(
//                             AssetImage(
//                               NHelperFunctions.isDarkMode(context)
//                                   ? NImages.money1
//                                   : NImages.money2,
//                             ), // استخدام صورة من الأصول
//                             size: 24, // حجم الأيقونة
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: NSizes.spaceBtwItems),
//                       NsectionHeading(
//                         title: 'الإيجار',
//                         onPressed: () {},
//                         showActionButton: false,
//                       ),
//                     ],
//                   ),
//                   //Rent Container
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   NRoundedContainer(
//                     backgroundColor: const Color(0xFF5C509A),
//                     height: 219,
//                     padding: const EdgeInsets.only(top: NSizes.sm),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(width: NSizes.spaceBtwItems),
//                             NsectionHeading(
//                               title: 'الإيجار',
//                               onPressed: () {},
//                               textColor: NColors.white,
//                               showActionButton: false,
//                             ),
//                           ],
//                         ),
//                         Stack(
//                           children: [
//                             Center(
//                               child: NRoundedContainer(
//                                 backgroundColor: const Color(0xFFA373E9),
//                                 height: 180,
//                                 padding: const EdgeInsets.all(NSizes.sm),
//                                 child: Stack(
//                                   children: [
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.topRight,
//                                           child: Text(
//                                             'إجمالي المبلغ',
//                                             textAlign: TextAlign.right,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'MAJALLA',
//                                               fontSize: 21,
//                                               color: NColors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             widget
//                                                 .rentAmount, // استخدام القيمة المتغيرة
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'MAJALLA',
//                                               fontSize: 21,
//                                               color: NColors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'موعد سداد الإيجار : ${widget.rentDueDate}', // استخدام القيمة المتغيرة
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'MAJALLA',
//                                               fontSize: 15,
//                                               color: NColors.black,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   // الأنشطة
//                   Row(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ImageIcon(
//                             AssetImage(
//                               NHelperFunctions.isDarkMode(context)
//                                   ? NImages.activity1
//                                   : NImages.activity2,
//                             ), // استخدام صورة من الأصول
//                             size: 24, // حجم الأيقونة
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: NSizes.spaceBtwItems),
//                       NsectionHeading(
//                         title: 'الأنشطة',
//                         onPressed: () {},
//                         textColor: NHelperFunctions.isDarkMode(context)
//                             ? NColors.white
//                             : NColors.black,
//                         showActionButton: false,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   NRoundedContainer(
//                     backgroundColor: const Color(0xFFA373E9),
//                     height: 50,
//                     padding: const EdgeInsets.only(top: NSizes.sm),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(width: NSizes.spaceBtwItems),
//                             NsectionHeading(
//                               title: 'أقترب موعد سداد الإيجار.',
//                               onPressed: () {},
//                               textColor: NColors.white,
//                               showActionButton: false,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                   NRoundedContainer(
//                     backgroundColor: const Color(0xFFA373E9),
//                     height: 50,
//                     padding: const EdgeInsets.only(top: NSizes.sm),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(width: NSizes.spaceBtwItems),
//                             NsectionHeading(
//                               title: 'تحدث المالك عن صيانة المصعد',
//                               onPressed: () {},
//                               textColor: NColors.white,
//                               showActionButton: false,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: NSizes.spaceBtwItems),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_condo/common/custom_shape/container/n_rounded_container.dart';
import 'package:smart_condo/common/custom_shape/container/primary_header_container.dart';
import 'package:smart_condo/common/custom_shape/container/search_container.dart';
import 'package:smart_condo/common/texts/section_heading.dart';
import 'package:smart_condo/features/personalization/screens/home/widgets/home_appbar.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String rentAmount = ''; // قيمة الإيجار
  String rentDueDate = ''; // تاريخ سداد الإيجار

  // دالة لتحميل البيانات من Firestore
  Future<void> loadRentDetails() async {
    try {
      // استعلام للحصول على بيانات الإيجار من Firestore
      var rentDoc = await FirebaseFirestore.instance
          .collection('rent')
          .doc('currentRent')
          .get();
      if (rentDoc.exists) {
        setState(() {
          rentAmount = rentDoc['amount']; // تحديث قيمة الإيجار
          rentDueDate = rentDoc['dueDate']; // تحديث تاريخ السداد
        });
      }
    } catch (e) {
      print("Error loading rent details: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadRentDetails(); // تحميل البيانات عند بدء الشاشة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            NPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  NHomeAppBar(),
                  SizedBox(height: NSizes.spaceBtwSections),
                  // SearchBar
                  NSearchContainer(text: 'أبحث عن ............', onTap: () {}),
                  // Heading
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
            // Home content
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: NSizes.defaultSpace),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            AssetImage(
                              NHelperFunctions.isDarkMode(context)
                                  ? NImages.money1
                                  : NImages.money2,
                            ),
                            size: 24,
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
                  // Rent Container
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
                                            rentAmount.isEmpty
                                                ? '1000 ريال سعودي'
                                                : rentAmount + ' ريال سعودي',
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
                                            rentDueDate.isEmpty
                                                ? '24/4/2025م'
                                                : 'موعد سداد الإيجار: $rentDueDate',
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
                  // الأنشطة
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            AssetImage(
                              NHelperFunctions.isDarkMode(context)
                                  ? NImages.activity1
                                  : NImages.activity2,
                            ),
                            size: 24,
                          ),
                        ],
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
}
