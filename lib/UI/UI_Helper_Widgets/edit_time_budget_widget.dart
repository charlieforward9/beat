import 'package:flutter/material.dart';

class EditTimeBudget extends StatefulWidget {
  EditTimeBudget({Key? key}) : super(key: key);

  @override
  State<EditTimeBudget> createState() => _EditTimeBudgetState();
}

class _EditTimeBudgetState extends State<EditTimeBudget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Text('Click To Go Back'),
          onPressed: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
