import 'package:flutter/material.dart';
import '/Recovery/models/sleep_widget_model.dart';

// =========== Sleep Bucket Widget ========== 
class SleepWidget extends StatelessWidget{

  final double percentage;

  const SleepWidget({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sleep Bucket Widget"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: MyFillingContainer(
                  progress: percentage / 100,
                  size: 100,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                ),
              ),
            ),
            Text('Fill Value: $percentage'),
          ],
        ),
      ),
    );
  }
}

class MyFillingContainer extends StatelessWidget {
  final double progress;
  final double size;
  final Color backgroundColor;
  final Color progressColor;
  const MyFillingContainer(
      {
        this.progress = 0,
        this.size = 0,
        this.backgroundColor = Colors.grey,
        this.progressColor = Colors.blue
      }
      );
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(          
          children: [
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

/*
class SleepWidget extends StatefulWidget {
  const SleepWidget({Key? key}) : super(key: key);

  @override
  State<SleepWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<SleepWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Sleep Widget Sample',
              style: TextStyle(fontSize: 20),
            ),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}
*/