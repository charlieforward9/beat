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
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2), borderRadius: BorderRadius.circular(50)),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      color: widget.goalColor,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint(widget.goalTitle + ' Card tapped.');
        },
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: Text(
                      widget.goalTitle,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 80,
                height: 50,
                child: Text(
                  widget.percentDone.round().toString() + '%',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.min,
            children: const [],
          )
        ]),
      ),
    );
  }
}

/*

*/
