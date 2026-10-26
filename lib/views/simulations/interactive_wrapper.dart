import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../models/lesson.dart';
import '../../models/simulation_type.dart';
import 'projectile_view.dart';
import 'sound_wave_view.dart';

class InteractiveViewWrapper extends StatelessWidget {
  final Lesson lesson;
  const InteractiveViewWrapper({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    Widget simulationWidget;
    switch (lesson.simulation) {
      case SimType.projectile:
        simulationWidget = const ProjectileSimulation();
        break;
      case SimType.soundWave:
        simulationWidget = const SoundWaveSimulation();
        break;
      default:
        simulationWidget = const Center(child: Text("Simulation Offline", style: TextStyle(color: Colors.white)));
    }

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.yellow),
        title: Text(lesson.title, style: const TextStyle(color: AppTheme.yellow, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.ink,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: simulationWidget,
          ),
        ),
      ),
    );
  }
}
