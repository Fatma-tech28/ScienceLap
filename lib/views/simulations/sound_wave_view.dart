import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/theme.dart';

class SoundWaveSimulation extends StatefulWidget {
  const SoundWaveSimulation({super.key});
  @override
  State<SoundWaveSimulation> createState() => _SoundWaveSimulationState();
}

class _SoundWaveSimulationState extends State<SoundWaveSimulation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePainter(_controller),
      child: Container(),
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;
  WavePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint()
      ..color = Colors.cyanAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    double yCenter = size.height / 2;
    double frequency = 0.05;
    double amplitude = 50.0;
    double phaseShift = animation.value * 2 * pi;

    path.moveTo(0, yCenter);
    for (double x = 0; x <= size.width; x++) {
      double y = yCenter + sin((x * frequency) + phaseShift) * amplitude;
      path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
    
    final path2 = Path();
    final paint2 = Paint()..color = AppTheme.yellow..strokeWidth = 2..style = PaintingStyle.stroke;
    path2.moveTo(0, yCenter);
    for (double x = 0; x <= size.width; x++) {
      double y = yCenter + sin((x * frequency * 1.5) - phaseShift) * (amplitude * 0.5);
      path2.lineTo(x, y);
    }
    canvas.drawPath(path2, paint2);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
