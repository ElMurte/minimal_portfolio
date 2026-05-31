// ...existing code...
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Static background with tech/data visuals.
/// Decorations are hidden when they overlap any provided avoidRects
/// (useful to prevent icons hitting text/buttons on small screens).
class AnimatedBackground extends StatelessWidget {
  /// Optional list of rectangles (logical pixels, relative to the same
  /// coordinate space as the background) to avoid drawing decorations over.
  final List<Rect>? avoidRects;

  /// Minimum width to render decorations at all (you can tune for mobile).
  final double minWidthForDecor;

  const AnimatedBackground({
    super.key,
    this.avoidRects,
    this.minWidthForDecor = 600.0,
  });

  bool _isAvoided(Rect r) {
    if (avoidRects == null || avoidRects!.isEmpty) return false;
    for (final a in avoidRects!) {
      if (r.overlaps(a)) return true;
    }
    return false;
  }

  double _leftFromRight(double right, double itemWidth, double totalW) =>
      totalW - right - itemWidth;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final showDecor = w >= minWidthForDecor;

    // approximate box sizes for avoidance checks
    double glyphBox(double size) => size * 1.36; // icon + padding
    double miniBarsBoxWidth(double scale) =>
        ((scale * 8).clamp(3.0, 8.0) * 5) + 8.0;
    double nodeClusterSize(double scale) =>
        (scale * 80).clamp(24.0, 140.0);

    return IgnorePointer(
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            // left mini bars
            if (showDecor)
  Builder(builder: (_) {
    final size = (w * 0.04).clamp(22.0, 48.0);
    final left = w * 0.44;
    final top = h * 0.38;
    final box = glyphBox(size);
    final rect = Rect.fromLTWH(left, top, box, box);
    return _isAvoided(rect)
        ? const SizedBox.shrink()
        : Positioned(
            left:  w * 0.13,
            top: h * 0.10,
            child: TechGlyph(
              icon: FontAwesomeIcons.dove,
              baseColor: Theme.of(context).brightness == Brightness.dark ? Colors.red : Colors.black,
              size: size,
            ),
          );
  }),
            if (showDecor)
              Builder(builder: (_) {
                final scale = w * 0.0009;
                final left = w * 0.03;
                final top = h * 0.18;
                final boxW = miniBarsBoxWidth(scale);
                final boxH = 44.0;
                final rect = Rect.fromLTWH(left, top, boxW, boxH);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, top: top, child: MiniBars(seed: 11, scale: scale));
              }),

            // right mini bars
            if (showDecor)
              Builder(builder: (_) {
                final scale = w * 0.0007;
                final right = w * 0.05;
                final boxW = miniBarsBoxWidth(scale);
                final left = _leftFromRight(right, boxW, w);
                final top = h * 0.12;
                final rect = Rect.fromLTWH(left, top, boxW, 44.0);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(right: right, top: top, child: MiniBars(seed: 22, scale: scale));
              }),

            // dashboard glyph (left)
            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.048).clamp(28.0, 56.0);
                final left = w * 0.13;
                final top = h * 0.28;
                final box = glyphBox(size);
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, top: top, child: TechGlyph(icon: Icons.dashboard, baseColor: Colors.blue.shade400, size: size));
              }),

            // cloud glyph (right)
            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.06).clamp(30.0, 64.0);
                final right = w * 0.20;
                final box = glyphBox(size);
                final left = _leftFromRight(right, box, w);
                final top = h * 0.34;
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(right: right, top: top, child: TechGlyph(icon: Icons.cloud, baseColor: Colors.indigo.shade300, size: size));
              }),

            // sparkle glyph (top center-left)
            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.04).clamp(22.0, 48.0);
                final left = w * 0.48;
                final top = h * 0.08;
                final box = glyphBox(size);
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, top: top, child: TechGlyph(icon: Icons.auto_awesome, baseColor: Colors.teal.shade300, size: size));
              }),

            // additional data/report/file/db icons
            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.038).clamp(20.0, 48.0);
                final left = w * 0.15;
                final top = h * 0.52;
                final box = glyphBox(size);
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, top: top, child: TechGlyph(icon: Icons.storage, baseColor: Colors.deepPurple.shade300, size: size));
              }),

            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.032).clamp(18.0, 42.0);
                final right = w * 0.08;
                final box = glyphBox(size);
                final left = _leftFromRight(right, box, w);
                final top = h * 0.48;
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(right: right, top: top, child: TechGlyph(icon: Icons.insert_drive_file, baseColor: Colors.grey.shade600, size: size));
              }),

            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.032).clamp(18.0, 42.0);
                final left = w * 0.05;
                final top = h * 0.46;
                final box = glyphBox(size);
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, top: top, child: TechGlyph(icon: Icons.bar_chart, baseColor: Colors.blue.shade300, size: size));
              }),

            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.036).clamp(20.0, 48.0);
                final right = w * 0.12;
                final box = glyphBox(size);
                final left = _leftFromRight(right, box, w);
                final top = h * 0.10;
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(right: right, top: top, child: TechGlyph(icon: Icons.pie_chart, baseColor: Colors.green.shade400, size: size));
              }),

            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.038).clamp(20.0, 48.0);
                final left = w * 0.36;
                final top = h * 0.07;
                final box = glyphBox(size);
                final rect = Rect.fromLTWH(left, top, box, box);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, top: top, child: TechGlyph(icon: Icons.analytics, baseColor: Colors.orange.shade300, size: size));
              }),

            // node cluster
            if (showDecor)
              Builder(builder: (_) {
                final scale = w * 0.0009;
                final left = w * 0.65;
                final top = h * 0.55;
                final size = nodeClusterSize(scale);
                final rect = Rect.fromLTWH(left, top, size, size);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, top: top, child: NodeCluster(scale: scale));
              }),

            // cube (bottom-left)
            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.08).clamp(48.0, 120.0);
                final left = w * 0.08;
                final bottom = h * 0.06;
                final top = h - bottom - size;
                final rect = Rect.fromLTWH(left, top, size, size);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(left: left, bottom: bottom, child: StaticCube3D(size: size));
              }),

            // sphere (bottom-right)
            if (showDecor)
              Builder(builder: (_) {
                final size = (w * 0.07).clamp(40.0, 100.0);
                final right = w * 0.08;
                final bottom = h * 0.08;
                final left = _leftFromRight(right, size, w);
                final top = h - bottom - size;
                final rect = Rect.fromLTWH(left, top, size, size);
                return _isAvoided(rect)
                    ? const SizedBox.shrink()
                    : Positioned(right: right, bottom: bottom, child: StaticSphere(size: size));
              }),

            // faint center radial accent
            Builder(builder: (_) {
              final boxW = (w * 0.28).clamp(120.0, 480.0);
              final boxH = (h * 0.28).clamp(120.0, 480.0);
              final left = (w - boxW) / 2;
              final top = (h - boxH) / 2;
              final rect = Rect.fromLTWH(left, top, boxW, boxH);
              if (_isAvoided(rect)) return const SizedBox.shrink();
              return Center(
                child: Opacity(
                  opacity: 0.03,
                  child: Container(
                    width: boxW,
                    height: boxH,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: RadialGradient(
                        colors: [
                          Theme.of(context).primaryColorLight.withAlpha(10),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

/// TechGlyph: static icon container (keeps previous visual style).
class TechGlyph extends StatelessWidget {
  final IconData icon;
  final Color baseColor;
  final double size;

  const TechGlyph({
    super.key,
    required this.icon,
    required this.baseColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final bg = baseColor.withAlpha(28);
    final border = baseColor.withAlpha(80);

    return Container(
      padding: EdgeInsets.all(size * 0.18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(size * 0.22),
        border: Border.all(color: border, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: baseColor.withAlpha(20),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, size: size, color: baseColor),
    );
  }
}

/// MiniBars: small static bar visuals resembling dashboards.
class MiniBars extends StatelessWidget {
  final int seed;
  final double scale;

  const MiniBars({super.key, required this.seed, required this.scale});

  @override
  Widget build(BuildContext context) {
    final rng = math.Random(seed);
    return Row(
      children: List.generate(5, (i) {
        final base = 8.0 + rng.nextDouble() * 18.0;
        final h = (base * scale).clamp(6.0, 44.0);
        final alpha = (120 - i * 10).clamp(80, 160);
        final color = Colors.blue.shade300.withAlpha(alpha);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: (scale * 8).clamp(3.0, 8.0),
          height: h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}

/// NodeCluster: static node cluster with fixed positions.
class NodeCluster extends StatelessWidget {
  final double scale;

  const NodeCluster({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    final centerColor = Colors.orange.shade300;
    final size = (scale * 80).clamp(24.0, 140.0);
    final centerSize = (scale * 24).clamp(12.0, 48.0);
    final r = (scale * 28).clamp(10.0, 44.0);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: centerSize,
            height: centerSize,
            decoration: BoxDecoration(
              color: centerColor.withAlpha(40),
              shape: BoxShape.circle,
            ),
          ),
          // four static nodes placed around center
          Positioned(left: size / 2 - r, top: size / 2, child: _nodeDot(scale)),
          Positioned(left: size / 2 + r - 8, top: size / 2, child: _nodeDot(scale)),
          Positioned(left: size / 2, top: size / 2 - r, child: _nodeDot(scale)),
          Positioned(left: size / 2, top: size / 2 + r - 8, child: _nodeDot(scale)),
        ],
      ),
    );
  }

  Widget _nodeDot(double scale) => Container(
        width: (scale * 6).clamp(4.0, 12.0),
        height: (scale * 6).clamp(4.0, 12.0),
        decoration: BoxDecoration(
          color: Colors.orange.shade200,
          shape: BoxShape.circle,
        ),
      );
}

/// StaticCube3D: simple isometric cube drawn with CustomPainter (static).
class StaticCube3D extends StatelessWidget {
  final double size;
  const StaticCube3D({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CubePainter(color: Theme.of(context).primaryColorDark),
    );
  }
}

class _CubePainter extends CustomPainter {
  final Color color;
  _CubePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final w = size.width;
    final h = size.height;

    final frontTopLeft = Offset(w * 0.25, h * 0.35);
    final frontTopRight = Offset(w * 0.75, h * 0.35);
    final frontBottomLeft = Offset(w * 0.25, h * 0.75);
    final frontBottomRight = Offset(w * 0.75, h * 0.75);

    final backTopLeft = Offset(w * 0.15, h * 0.15);
    final backTopRight = Offset(w * 0.65, h * 0.15);
    final backBottomLeft = Offset(w * 0.15, h * 0.55);
    final backBottomRight = Offset(w * 0.65, h * 0.55);

    paint.color = color.withAlpha(180);
    final leftFace = Path()
      ..moveTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(frontTopLeft.dx, frontTopLeft.dy)
      ..lineTo(frontBottomLeft.dx, frontBottomLeft.dy)
      ..lineTo(backBottomLeft.dx, backBottomLeft.dy)
      ..close();
    canvas.drawPath(leftFace, paint);

    paint.color = color.withAlpha(220);
    final rightFace = Path()
      ..moveTo(backTopRight.dx, backTopRight.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(frontBottomRight.dx, frontBottomRight.dy)
      ..lineTo(backBottomRight.dx, backBottomRight.dy)
      ..close();
    canvas.drawPath(rightFace, paint);

    paint.color = color.withAlpha(140);
    final topFace = Path()
      ..moveTo(backTopLeft.dx, backTopLeft.dy)
      ..lineTo(backTopRight.dx, backTopRight.dy)
      ..lineTo(frontTopRight.dx, frontTopRight.dy)
      ..lineTo(frontTopLeft.dx, frontTopLeft.dy)
      ..close();
    canvas.drawPath(topFace, paint);

    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..color = color.withAlpha(220)
      ..strokeWidth = 1.0;
    canvas.drawPath(leftFace, stroke);
    canvas.drawPath(rightFace, stroke);
    canvas.drawPath(topFace, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// StaticSphere: static decorative sphere using radial gradient.
class StaticSphere extends StatelessWidget {
  final double size;
  const StaticSphere({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).primaryColor.withAlpha(180);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [base, base.withAlpha(90), Colors.transparent],
          stops: const [0.0, 0.6, 1.0],
        ),
        boxShadow: [
          BoxShadow(color: base.withAlpha(30), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
    );
      }}