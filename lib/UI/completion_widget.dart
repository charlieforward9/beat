import 'package:flutter/material.dart';

import 'completion_bucket.dart';
import 'completion_ring.dart';

class CompletionWidget extends StatefulWidget {
  final double bucketProgress;
  final double firstRingProgress;
  final double secondRingProgress;
  final double thirdRingProgress;
  final double fourthRingProgress;

  const CompletionWidget({
    Key? key,
    required this.bucketProgress,
    required this.firstRingProgress,
    required this.secondRingProgress,
    required this.thirdRingProgress,
    required this.fourthRingProgress,
  }) : super(key: key);

  @override
  State<CompletionWidget> createState() => _CompletionWidgetState();
}

class _CompletionWidgetState extends State<CompletionWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        child: Stack(
          alignment: Alignment.center,
          //TODO: Make this entire child a widget, pass in the progress values and nothing else.
          children: [
            //TODO: The colors and goal titles should come from its own widget, not the parameters the completion widget.
            
            CompletionRing(progress: widget.fourthRingProgress, level: 2),
            CompletionRing(progress: widget.thirdRingProgress, level: 2.5),
            CompletionRing(progress: widget.secondRingProgress, level: 3.3),
            CompletionRing(progress: widget.firstRingProgress, level: 4.9),
            CompletionBucket(progress: widget.bucketProgress),
          ],
        ),
      ),
    );
  }
}
