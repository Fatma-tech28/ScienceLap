import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../models/simulation_type.dart';

class LocalLessonRepository {
  // Simulating an offline NoSQL database (e.g., Hive)
  static List<Lesson> getLessons() {
    return [
      Lesson(
        title: "Projectile Motion",
        emoji: "🎯",
        gradient: [const Color(0xFF1331A8), const Color(0xFF2B6EE6)],
        simulation: SimType.projectile,
        subject: "Physics",
        gradeLevel: 1,
      ),
      Lesson(
        title: "Sound Vibrations",
        emoji: "🔊",
        gradient: [const Color(0xFF1B3A5C), const Color(0xFF2F5F8F)],
        simulation: SimType.soundWave,
        subject: "Physics",
        gradeLevel: 1,
      ),
      Lesson(
        title: "Plant Osmosis",
        emoji: "🥔",
        gradient: [const Color(0xFF3F7A1F), const Color(0xFF1A2A10)],
        subject: "Biology",
        gradeLevel: 1,
      ),
      Lesson(
        title: "Cell Structure",
        emoji: "🧫",
        gradient: [const Color(0xFF7B5EA7), const Color(0xFF6FA83D)],
        subject: "Biology",
        gradeLevel: 2,
      ),
    ];
  }
}
