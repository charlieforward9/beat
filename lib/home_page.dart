import 'package:flutter/material.dart';
import 'package:beat/UI/completion_ring.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: SizedBox(width: 240, child: TaskCompletionRing()),
      ),
    );
  }
}
