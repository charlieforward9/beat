import 'package:flutter/material.dart';

class EditTimeBudget extends StatefulWidget {
  EditTimeBudget({Key? key}) : super(key: key);

  @override
  State<EditTimeBudget> createState() => _EditTimeBudgetState();
}

class _EditTimeBudgetState extends State<EditTimeBudget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
    ));
  }
}
