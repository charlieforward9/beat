import '../UI/UI_Helper_Widgets/edit_time_budget_widget.dart';
import 'package:flutter/material.dart';

//TODO This may be better as a popup instead of an entire page. Discuss.

class EditTimePage extends StatelessWidget {
  const EditTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Text("Text"),
          EditTimeBudget(),
          Spacer(),
        ],
      ),
    );
  }
}
