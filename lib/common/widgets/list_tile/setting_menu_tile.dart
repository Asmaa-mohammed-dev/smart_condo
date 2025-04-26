import 'package:flutter/material.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class NSettingMenuTile extends StatelessWidget {
  const NSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = NHelperFunctions.isDarkMode(context);
    return ListTile(
      leading: Icon(icon, size: 38, color: NColors.primary),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MAJALLA',
            fontSize: 21,
            color: dark ? Colors.white : Colors.black),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MAJALLA',
            fontSize: 15,
            color: dark ? Colors.white : Colors.black),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
