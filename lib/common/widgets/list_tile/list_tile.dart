// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:smart_condo/common/widgets/images/n_circular_image.dart';
// import 'package:smart_condo/data/repositories/authentication.dart';
// import 'package:smart_condo/utils/constants/colors.dart';
// import 'package:smart_condo/utils/constants/image_strings.dart';

// class NUserProfileTitle extends StatelessWidget {
//   const NUserProfileTitle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     if (!Get.isRegistered<UserModel>()) {
//       UserModel newUser = Get.find<UserModel>();

//       return ListTile(
//         leading: NCircularImage(
//           image: NImages.user,
//           width: 50,
//           height: 50,
//           padding: 0,
//         ),
//         title: Text(
//           newUser.username,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: 'MAJALLA',
//             fontSize: 21,
//             color: NColors.white,
//           ),
//         ),
//         subtitle: Text(
//           'طالب جامعي',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: 'MAJALLA',
//             fontSize: 15,
//             color: NColors.white,
//           ),
//         ),
//         trailing: IconButton(
//           onPressed: () {},
//           icon: const Icon(Iconsax.edit, color: NColors.white),
//         ),
//       );
//     } else {
//       // رجعي ويدجت افتراضي زي Placeholder أو SizedBox
//       return const SizedBox(); // أو Text("لا يوجد مستخدم")
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:smart_condo/common/widgets/images/n_circular_image.dart';
// import 'package:smart_condo/data/repositories/authentication.dart';
// import 'package:smart_condo/utils/constants/colors.dart';
// import 'package:smart_condo/utils/constants/image_strings.dart';

// class NUserProfileTitle extends StatelessWidget {
//   const NUserProfileTitle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     if (Get.isRegistered<UserModel>()) {
//       UserModel newUser = Get.find<UserModel>();

//       return ListTile(
//         leading: NCircularImage(
//           image: NImages.user,
//           width: 50,
//           height: 50,
//           padding: 0,
//         ),
//         title: Text(
//           newUser.username,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: 'MAJALLA',
//             fontSize: 21,
//             color: NColors.white,
//           ),
//         ),
//         subtitle: const Text(
//           'طالب جامعي',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontFamily: 'MAJALLA',
//             fontSize: 15,
//             color: NColors.white,
//           ),
//         ),
//         trailing: IconButton(
//           onPressed: () {},
//           icon: const Icon(Iconsax.edit, color: NColors.white),
//         ),
//       );
//     } else {
//       return const SizedBox(); // أو ممكن Text('لا يوجد مستخدم')
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/data/repositories/authentication.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';

class NUserProfileTitle extends StatelessWidget {
  const NUserProfileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    // التحقق مما إذا كانت الـ UserModel مسجلة في GetX
    UserModel? newUser;
    if (Get.isRegistered<UserModel>()) {
      newUser = Get.find<UserModel>(); // استرجاع الـ UserModel المسجل
    }

    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(
            NImages.user), // صورة افتراضية إذا لم يكن المستخدم مسجلاً
      ),
      title: Text(
        newUser?.username ??
            'مستخدم غير معروف', // في حالة عدم وجود الـ UserModel استخدم اسم افتراضي
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'MAJALLA',
          fontSize: 21,
          color: NColors.white,
        ),
      ),
      // subtitle: Text(
      //   'طالب جامعي',
      //   style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontFamily: 'MAJALLA',
      //     fontSize: 15,
      //     color: NColors.white,
      //   ),
      // ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit, color: NColors.white),
      ),
    );
  }
}
