import 'dart:math';
import 'package:flutter/material.dart';

class GrainOverlay extends StatelessWidget {
  final double opacity;
  final Widget? child;

  const GrainOverlay({
    super.key,
    this.opacity = 0.04,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (child != null) child!,
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _GrainPainter(opacity: opacity),
            ),
          ),
        ),
      ],
    );
  }
}

class _GrainPainter extends CustomPainter {
  final double opacity;
  final List<Offset> _dots;

  _GrainPainter({required this.opacity})
      : _dots = _generateDots();

  static List<Offset> _generateDots() {
    final random = Random(42);
    final dots = <Offset>[];
    for (int i = 0; i < 800; i++) {
      dots.add(Offset(
        random.nextDouble(),
        random.nextDouble(),
      ));
    }
    return dots;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final dot in _dots) {
      final paint = Paint()
        ..color = Colors.black.withOpacity(opacity * (0.3 + Random().nextDouble() * 0.7));
      canvas.drawCircle(
        Offset(dot.dx * size.width, dot.dy * size.height),
        1.0,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
