import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/common/custom_shape/container/n_rounded_container.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/sizes.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class TSingleBankAccount extends StatelessWidget {
  const TSingleBankAccount({
    super.key,
    required this.selectedAddress,
    required this.name,
    required this.phone,
    required this.city,
    required this.street,
  });
  final bool selectedAddress;
  final String name, phone, city, street;

  @override
  Widget build(BuildContext context) {
    final dark = NHelperFunctions.isDarkMode(context);
    return NRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(NSizes.md),
      backgroundColor: selectedAddress
          ? NColors.primary.withValues(alpha: (0.5))
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? NColors.darkerGrey
              : NColors.grey,
      margin: const EdgeInsets.only(bottom: NSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? NColors.light
                      : NColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name, // عرض اسم العنوان
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  color: NHelperFunctions.isDarkMode(context)
                      ? Colors.white
                      : Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: NSizes.sm / 2),
              Text(
                phone, // عرض رقم الهاتف
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  color: NHelperFunctions.isDarkMode(context)
                      ? Colors.white
                      : Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: NSizes.sm / 2),
              Text(
                '$street، $city', // عرض المدينة والدولة
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MAJALLA',
                  color: NHelperFunctions.isDarkMode(context)
                      ? Colors.white
                      : Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
