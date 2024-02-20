import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget customListTile(String title, IconData icon, String option) {
  return ListTile(
    leading: Icon(
      icon,
      size: 30,
      color: AppColors.primary,
    ),
    title: Text(title),
    trailing: Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(option),
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    ),
  );
}
