import 'package:flutter/material.dart';

class CompletionBucket extends StatefulWidget {
  final double progress;
  const CompletionBucket({Key? key, required this.progress}) : super(key: key);

  @override
  State<CompletionBucket> createState() => _CompletionBucketState();
}

class _CompletionBucketState extends State<CompletionBucket> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyFillingContainer(progress: widget.progress / 100, size: 75),
    );
  }
}

class MyFillingContainer extends StatelessWidget {
  final double progress;
  final double size;
  final Color backgroundColor;
  final Color progressColor;
  const MyFillingContainer(
      {this.progress = 0,
      this.size = 0,
      this.backgroundColor = Colors.blue,
      //TODO: Figure out how colors work and get up a primary scheme
      this.progressColor = const Color.fromRGBO(25, 118, 210, 1)});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(children: [
          Container(
            color: backgroundColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size * progress,
              color: progressColor,
            ),
          )
        ]),
      ),
    );
  }
}
