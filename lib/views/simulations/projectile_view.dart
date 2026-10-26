import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/theme.dart';

class ProjectileSimulation extends StatefulWidget {
  const ProjectileSimulation({super.key});
  @override
  State<ProjectileSimulation> createState() => _ProjectileSimulationState();
}

class _ProjectileSimulationState extends State<ProjectileSimulation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProjectilePainter(_controller),
      child: Container(),
    );
  }
}

class ProjectilePainter extends CustomPainter {
  final Animation<double> animation;
  ProjectilePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white24..strokeWidth = 1..style = PaintingStyle.stroke;
    
    for (double i = 0; i < size.width; i += 40) canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    for (double i = 0; i < size.height; i += 40) canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);

    double t = animation.value * 3.0; 
    double v0 = 120.0; 
    double angle = 45 * (pi / 180); 
    double g = 9.8 * 15; 
    
    double startX = 40;
    double startY = size.height - 40;

    double x = startX + (v0 * cos(angle) * t);
    double y = startY - ((v0 * sin(angle) * t) - (0.5 * g * t * t));

    final trailPaint = Paint()..color = AppTheme.yellow.withOpacity(0.5)..strokeWidth = 3..style = PaintingStyle.stroke;
    Path path = Path()..moveTo(startX, startY);
    for (double pt = 0; pt <= 3.0; pt += 0.05) {
      double px = startX + (v0 * cos(angle) * pt);
      double py = startY - ((v0 * sin(angle) * pt) - (0.5 * g * pt * pt));
      if (py > startY) break;
      path.lineTo(px, py);
    }
    canvas.drawPath(path, trailPaint);

    canvas.drawCircle(Offset(x, y.clamp(0, startY)), 12, Paint()..color = Colors.redAccent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
