// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
// import 'package:smart_condo/utils/constants/colors.dart';
// import 'package:smart_condo/utils/constants/sizes.dart';

// class AddNewBankScreen extends StatelessWidget {
//   const AddNewBankScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar:
//             NAppBar(showBackArrow: true, title: Text('أضف بطاقة بنك جديدة')),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(NSizes.defaultSpace),
//             child: Form(
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(Iconsax.user), labelText: 'الاسم'),
//                   ),
//                   const SizedBox(height: NSizes.spaceBtwInputFields),
//                   TextFormField(
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(Iconsax.mobile),
//                         labelText: 'رقم التلفون'),
//                   ),
//                   const SizedBox(height: NSizes.spaceBtwInputFields),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(Iconsax.bank),
//                               labelText: 'رقم بطاقة البنك'),
//                         ),
//                       ),
//                       const SizedBox(width: NSizes.spaceBtwInputFields),
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                               prefixIcon: Icon(Iconsax.code),
//                               labelText: 'الرقم البريدي'),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: NSizes.spaceBtwInputFields),
//                   TextFormField(
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(Iconsax.global), labelText: 'العنوان'),
//                   ),
//                   const SizedBox(height: NSizes.spaceBtwInputFields),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: NColors.primary, // لون الزر أزرق
//                       ),
//                       child: Text('حفظ'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/sizes.dart';

class AddNewBankScreen extends StatefulWidget {
  const AddNewBankScreen({super.key});

  @override
  State<AddNewBankScreen> createState() => _AddNewAdressScreenState();
}

class _AddNewAdressScreenState extends State<AddNewBankScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final streetController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    streetController.dispose();
    postalCodeController.dispose();
    cityController.dispose();

    super.dispose();
  }

  Future<void> saveAddress() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        streetController.text.isEmpty ||
        postalCodeController.text.isEmpty ||
        cityController.text.isEmpty) {
      Get.snackbar('خطأ', 'يرجى تعبئة جميع الحقول');
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('banks').add({
        'name': nameController.text,
        'phone': phoneController.text,
        'street': streetController.text,
        'postalCode': postalCodeController.text,
        'city': cityController.text,
        'createdAt': Timestamp.now(),
      });

      Get.back(); // العودة إلى الشاشة السابقة بعد الحفظ
    } catch (e) {
      Get.snackbar('حدث خطأ', 'لم يتم الحفظ: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:
            NAppBar(showBackArrow: true, title: const Text('أضف عنوان جديد')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(NSizes.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: 'الاسم',
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'رقم التلفون',
                    ),
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: streetController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.bank),
                            labelText: 'رقم بطاقة البنك',
                          ),
                        ),
                      ),
                      const SizedBox(width: NSizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          controller: postalCodeController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'الرقم البريدي',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'العنوان',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: NSizes.spaceBtwInputFields),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: saveAddress,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NColors.primary,
                      ),
                      child: const Text('حفظ'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
