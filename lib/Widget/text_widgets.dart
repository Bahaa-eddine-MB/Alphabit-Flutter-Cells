import 'package:first_session/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextWidget {
  static Widget appTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.secondary),
    );
  }
}
