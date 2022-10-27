import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class decimalPicker extends StatefulWidget {
  Widget widget;
  int hourCurrentValue;
  int minCurrentValue;
  final int minValue;
  final int maxValue;
  final int step;

  decimalPicker({
    required this.widget,
    required this.hourCurrentValue,
    required this.minCurrentValue,
    required this.minValue,
    required this.maxValue,
    required this.step,
  });

  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<decimalPicker> {
  int _currentIntValue = 10;
  int _currentHorizontalIntValue = 10;

  double test = 2.45;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(height: 16),
        // Text('Default', style: Theme.of(context).textTheme.headline6),
        Column(
          children: [
            Text("Hours: "),
            NumberPicker(
              value: widget.hourCurrentValue,
              minValue: widget.minValue,
              maxValue: widget.maxValue,
              step: widget.step,
              haptics: true,
              onChanged: (value) =>
                  setState(() => this.widget.hourCurrentValue = value),
            ),
          ],
        ),
        Column(
          children: [
            Text("Minutes: "),
            NumberPicker(
              value: widget.minCurrentValue,
              minValue: 0,
              maxValue: 60,
              step: 1,
              haptics: true,
              onChanged: (value) =>
                  setState(() => widget.minCurrentValue = value),
            ),
          ],
        ),
      ],
    );
  }
}
