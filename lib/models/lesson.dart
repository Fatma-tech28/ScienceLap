import 'package:flutter/material.dart';
import 'simulation_type.dart';

class Lesson {
  final String title;
  final String emoji;
  final List<Color> gradient;
  final SimType simulation;
  final String subject;
  final int gradeLevel;

  Lesson({
    required this.title,
    required this.emoji,
    required this.gradient,
    this.simulation = SimType.none,
    required this.subject,
    required this.gradeLevel,
  });
}
