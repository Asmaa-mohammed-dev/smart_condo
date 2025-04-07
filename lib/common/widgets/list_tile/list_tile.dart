import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/common/widgets/images/n_circular_image.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';

class NUserProfileTitle extends StatelessWidget {
  const NUserProfileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: NCircularImage(
        image: NImages.user,

        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'أحمد',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'MAJALLA',
          fontSize: 21,
          color: NColors.white,
        ),
      ),
      subtitle: Text(
        'طالب جامعي',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'MAJALLA',
          fontSize: 15,
          color: NColors.white,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit, color: NColors.white),
      ),
    );
  }
}
