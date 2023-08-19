import 'package:cats/config/routes/app_routes.dart';
import 'package:cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CatsApp extends StatelessWidget {
  const CatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
