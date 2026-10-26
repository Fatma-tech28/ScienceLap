import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'controllers/dashboard_controller.dart';

void main() {
  runApp(const ClassroomToolApp());
}

class ClassroomToolApp extends StatelessWidget {
  const ClassroomToolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduBoard Interactive',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const DashboardController(),
    );
  }
}
