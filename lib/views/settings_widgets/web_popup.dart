import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:beat/config/global.dart';

class WebPopup extends StatelessWidget {
  final Uri url;
  const WebPopup({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Center(
        child: Column(
          children: [
            //Text("Authenticate Strava"),
            SizedBox(
              height: MediaQuery.of(context).size.height * (2 / 3),
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: url.toString(),
                javascriptMode: JavascriptMode.unrestricted,
                userAgent: userAgent,
                onProgress: (int progress) {
                  log('WebView is loading (progress : $progress%)');
                },
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, // function used to perform after pressing the button
          child: const Text('Close'),
        ),
      ],
    );
  }
}
