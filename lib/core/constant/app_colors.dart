import 'package:flutter/material.dart';

abstract class AppColors {

  // Light Theme
  static const Color mainColorLight = Color(0xFF007AFF);  // أزرق فاتح
  static const Color secondaryColorLight = Color(0xFF34C759);  // أخضر معتدل
  static const Color backgroundColorLight = Color(0xFFF7F6FF);  // أبيض
  static const Color iconColorLight = Color(0xFF0056D2);  // أزرق غامق
  static const Color textColorLight = Color(0xFF1C1C1E);  // رمادي داكن
  static const Color unselectedTextColorLight = Color(0xFF8E8E93);  // رمادي فاتح للأيقونات غير المحددة
  static const Color alignColorLight = Color(0xFFE5E5EA);  // رمادي فاتح للأقسام

  // Dark Theme
  static const Color mainColorDark = Color(0xFF30D158);  // أزرق غامق
  static const Color secondaryColorDark = Color(0xFF30D158);  // أخضر داكن
  static const Color backgroundColorDark = Color(0xFF1C1C1E);  // رمادي داكن جدًا
  static const Color iconColorDark = Color(0xFF0A84FF);  // أزرق متوسط
  static const Color textColorDark = Color(0xFFEBEBF5);  // رمادي فاتح
  static const Color unselectedTextColorDark = Color(0xFF636366);  // رمادي متوسط للأيقونات غير المحددة
  static const Color alignColorDark = Color(0xFF2C2C2E);  // رمادي داكن

  static const Color successSnackBarColor = Colors.green;
  static const Color errorSnackBarColor = Colors.redAccent;
  static const Color warningSnackBarColor = Colors.amber;


}

