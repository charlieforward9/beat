import 'dart:math';

import 'package:flutter/material.dart';

class CompletionRing extends StatefulWidget {
  //The level parameter controls the radius of the ring, TODO find a better way to control the radius
  const CompletionRing({Key? key, required this.progress, required this.level})
      : super(key: key);

  final double level;
  final double progress;

  @override
  State<CompletionRing> createState() => _CompletionRingState();
}

class _CompletionRingState extends State<CompletionRing> {
  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.of(context);
    return AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
            painter: RingPainter(
                progress: widget.progress,
                taskNotCompletedColor: themeData.taskRing(), //TODO: SEE BELOW
                taskCompletedColor:
                    themeData.accent(), //TODO: change these to beat themes
                radiusController: widget.level)));
  }
}

class AppTheme {
  final BuildContext context;
  AppTheme._(this.context); // make this constructor private

  static AppTheme of(BuildContext context) =>
      AppTheme._(context); // pass context to above constructor

  Color taskRing() {
    return Theme.of(context).primaryColor;
  }

  Color accent() {
    return Theme.of(context).primaryColorDark;
  }
}

//TODO Outline the rings with a perimiter
class RingPainter extends CustomPainter {
  // 1. add a constructor and properties that can be set from the parent widget
  RingPainter(
      {required this.progress,
      required this.taskNotCompletedColor,
      required this.taskCompletedColor,
      required this.radiusController});
  // a value between 0 and 100
  final double progress;
  // background color to use when the task is not completed
  final Color taskNotCompletedColor;
  // foreground color to use when the task is completed
  final Color taskCompletedColor;
  //dictates the radius of the circle
  final double radiusController;

  @override
  void paint(Canvas canvas, Size size) {
    // 2. configure the paint and drawing properties
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / radiusController;

    // 3. create and configure the background paint
    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskNotCompletedColor
      ..style = PaintingStyle.stroke;
    // 4. draw a circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // 5. create and configure the foreground paint
    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = PaintingStyle.stroke;
    // 6. draw an arc that starts from the top (-pi / 2)
    // and sweeps and angle of (2 * pi * progress)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * (progress / 100),
      false,
      foregroundPaint,
    );
  }

  // 7. only return true if the old progress value
  // is different from the new one
  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
