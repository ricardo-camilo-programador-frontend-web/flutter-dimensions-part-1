import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaveformWidget extends StatefulWidget {
  final Color color;
  const WaveformWidget({super.key, required this.color});

  @override
  State<WaveformWidget> createState() => _WaveformWidgetState();
}

class _WaveformWidgetState extends State<WaveformWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(double.infinity, 48),
          painter: _WavePainter(widget.color, _c.value),
        );
      },
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;
  final double t;
  _WavePainter(this.color, this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final path = Path();
    for (double x = 0; x <= size.width; x += 4) {
      final y = size.height / 2 + (size.height / 3) *
          (0.5 * math.sin((x / size.width * 12) + t * 6) + 0.5 * math.sin((x / size.width * 24) - t * 4));
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => true;
}
