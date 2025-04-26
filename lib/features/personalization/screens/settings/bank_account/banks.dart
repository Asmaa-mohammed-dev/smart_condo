import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/features/personalization/screens/settings/bank_account/add_new_bank_account.dart';
import 'package:smart_condo/features/personalization/screens/settings/bank_account/single_bank_account.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class UserBankScreen extends StatelessWidget {
  const UserBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddNewBankScreen()),
          backgroundColor: NColors.primary,
          child: const Icon(Iconsax.add, color: NColors.white),
        ),
        appBar: NAppBar(
          showBackArrow: true,
          title: Text(
            'بطاقة بنكية',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              color: NHelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
              fontSize: 22,
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('banks')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('لا توجد بطاقات بنكية مضافة.'));
            }

            final addresses = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.all(NSizes.defaultSpace),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final data = addresses[index].data() as Map<String, dynamic>;

                return TSingleBankAccount(
                  selectedAddress: index == 0,
                  name: data['name'] ?? 'اسم غير محدد',
                  phone: data['phone'] ?? 'رقم الهاتف غير محدد',
                  city: data['city'] ?? 'الرقم البريدي غير محدد',
                  street: data['street'] ?? 'بطاقة بنكية غير محددة',
                );
              },
            );
          },
        ),
      ),
    );
  }
}
