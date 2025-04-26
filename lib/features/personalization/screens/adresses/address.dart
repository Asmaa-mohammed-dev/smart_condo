import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/features/personalization/screens/adresses/add_new_address.dart';
import 'package:smart_condo/features/personalization/screens/adresses/single_address.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddNewAdressScreen()),
          backgroundColor: NColors.primary,
          child: const Icon(Iconsax.add, color: NColors.white),
        ),
        appBar: NAppBar(
          showBackArrow: true,
          title: Text(
            'العنوان',
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
              .collection('addresses')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('لا توجد عناوين مضافة.'));
            }

            final addresses = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.all(NSizes.defaultSpace),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final data = addresses[index].data() as Map<String, dynamic>;

                return TSingleAddress(
                  selectedAddress: index == 0,
                  name: data['name'] ?? 'اسم غير محدد',
                  phone: data['phone'] ?? 'رقم غير محدد',
                  city: data['city'] ?? 'مدينة غير محددة',
                  country: data['country'] ?? 'دولة غير محددة',
                );
              },
            );
          },
        ),
      ),
    );
  }
}
