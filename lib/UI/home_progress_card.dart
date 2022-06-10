import 'package:flutter/material.dart';

class HomeProgressCard extends StatefulWidget {
  const HomeProgressCard(
      {Key? key,
      required this.goalTitle,
      required this.percentDone,
      required this.goalColor})
      : super(key: key);

  final String goalTitle;
  final double percentDone;
  final Color goalColor;

  @override
  State<HomeProgressCard> createState() => _HomeProgressCardState();
}

class _HomeProgressCardState extends State<HomeProgressCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.goalColor,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Column(children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 70,
                height: 50,
                child: Text(widget.goalTitle,
                    style: const TextStyle(fontSize: 20)),
              ),
              SizedBox(
                width: 80,
                height: 50,
                child: Text(
                  widget.percentDone.round().toString() + '%',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 150,
                height: 50,
                child: Text(
                  '<Metrics Section>',
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
