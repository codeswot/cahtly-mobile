import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Colors.purple,

    // background: AppColors.background,
  ),
  useMaterial3: true,
  textTheme: TextTheme(
    labelLarge: TextStyle(fontSize: 15.sp),
    bodyMedium: TextStyle(fontSize: 30.sp),
  ),
  fontFamily: 'Nunito',
);
