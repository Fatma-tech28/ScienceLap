import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../models/lesson.dart';
import '../../models/simulation_type.dart';
import '../simulations/interactive_wrapper.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  const LessonCard({super.key, required this.lesson});

  void _openSimulation(BuildContext context) {
    if (lesson.simulation != SimType.none) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => InteractiveViewWrapper(lesson: lesson)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openSimulation(context),
      child: Column(
        children: [
          Container(
            height: 100, width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(colors: lesson.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: const [
                BoxShadow(color: Color(0x615A3C00), offset: Offset(0, 10), blurRadius: 15),
                BoxShadow(color: Colors.black26, offset: Offset(0, 4)),
              ],
            ),
            alignment: Alignment.center,
            child: Text(lesson.emoji, style: const TextStyle(fontSize: 48)),
          ),
          const SizedBox(height: 12),
          Text(
            lesson.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppTheme.ink),
          )
        ],
      ),
    );
  }
}
