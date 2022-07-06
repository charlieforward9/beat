import 'package:beat/Common_Widgets/edit_time_budget_widget.dart';
import 'package:flutter/material.dart';

class EditTimePage extends StatelessWidget {
  const EditTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Daily Goal Time Budgeting')),
        body: Center(
          child: Column(
            children: <Widget>[
              Spacer(),
              EditTimeBudget(),
              Spacer(),
            ],
          ),
        ));
  }
}
