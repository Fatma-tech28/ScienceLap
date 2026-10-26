import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../models/lesson.dart';
import '../data/local_storage.dart';
import '../views/widgets/lesson_card.dart';

class DashboardController extends StatefulWidget {
  const DashboardController({super.key});

  @override
  State<DashboardController> createState() => _DashboardControllerState();
}

class _DashboardControllerState extends State<DashboardController> {
  int activeGrade = 1;
  late List<Lesson> allLessons;

  @override
  void initState() {
    super.initState();
    allLessons = LocalLessonRepository.getLessons();
  }

  @override
  Widget build(BuildContext context) {
    final gradeLessons = allLessons.where((l) => l.gradeLevel == activeGrade).toList();
    final physics = gradeLessons.where((l) => l.subject == "Physics").toList();
    final biology = gradeLessons.where((l) => l.subject == "Biology").toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTeacherHeader(),
            _buildTabs(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFD800), Color(0xFFFFD100), Color(0xFFFFC700)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    _buildSectionTitle("Grade $activeGrade", "High School"),
                    if (physics.isNotEmpty) _buildLessonGrid("Physics", physics),
                    const SizedBox(height: 32),
                    if (biology.isNotEmpty) _buildLessonGrid("Biology", biology),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF2C2C2C), Color(0xFF111111)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Row(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.yellow, width: 3),
              color: Colors.blueGrey,
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 36),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Ms. Nadia Farouk", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Biology & Physics", style: TextStyle(color: AppTheme.yellow, fontSize: 16)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          final grade = index + 1;
          final isActive = grade == activeGrade;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => activeGrade = grade),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: isActive ? AppTheme.yellow : const Color(0xFF262626),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: isActive ? const Color(0xFFB88F00) : const Color(0xFF1A1A1A),
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Grade $grade",
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSectionTitle(String main, String sub) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x595A3C00), offset: Offset(0, 8), blurRadius: 12)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(main, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900)),
          const SizedBox(width: 12),
          Text(sub, style: const TextStyle(color: AppTheme.yellow, fontSize: 20)),
        ],
      ),
    );
  }

  Widget _buildLessonGrid(String title, List<Lesson> lessons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title  •  ${lessons.length} topics", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
          ),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return LessonCard(lesson: lessons[index]);
          },
        ),
      ],
    );
  }
}
