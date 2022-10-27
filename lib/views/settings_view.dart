import 'dart:developer';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:beat/data/Integration/services/wfService.dart';
import 'package:beat/data/Integration/services/wfServiceTest.dart';
import 'package:beat/views/settings_widgets/web_popup.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Amplify.DataStore.clear();
                Amplify.Auth.signOut();
              },
              child: const Text("Sign out")),
          ElevatedButton(
            onPressed: () {
              WFServiceTest().weFitterTestSequencePart1().then(
                    (url) => url != null
                        ? showDialog(
                            context: context,
                            builder: ((context) => WebPopup(url: url)),
                          )
                        : log("Unable to retrieve auth URL from strava"),
                  );
            },
            child: Text(
                "Creates profile using currentUser data\n then prompts auth with Strava account"),
          ),
          ElevatedButton(
              onPressed: () => WFService().mapWFWorkoutToBeatActivity(),
              child: Text("Sync Strava")),
        ],
      ),
    );
  }
}
