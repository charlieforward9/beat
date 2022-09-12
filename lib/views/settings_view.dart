import 'package:beat/config/global.dart';
import 'package:beat/data/Integration/services/wfServiceTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                  "Creates profile using currentUser data\n then prompts auth with Strava account"),
              FloatingActionButton(
                onPressed: () async => InAppBrowser().openUrlRequest(
                    urlRequest: URLRequest(
                        url: await WFServiceTest().weFitterTestSequencePart1()),
                    options: InAppBrowserClassOptions(
                        crossPlatform: InAppBrowserOptions(hideUrlBar: false),
                        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                                javaScriptEnabled: true,
                                userAgent: userAgent)))),
                child: Icon(Icons.person),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Maps all the workouts to activities\n on days that goals are set (no dupes)",
                softWrap: false,
              ),
              FloatingActionButton(
                onPressed: () => WFServiceTest().weFitterTestSequencePart2(),
                child: Icon(Icons.fitness_center),
              )
            ],
          )
        ],
      ),
    );
  }
}
