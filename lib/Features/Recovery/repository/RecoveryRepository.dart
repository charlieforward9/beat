import 'dart:developer';

import 'package:beat/Features/Recovery/models/Recovery.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class RecoveryRepository{
  Future<Recovery?> getRecoveryById(String id) async {
    try {
        final request = ModelQueries.get(Recovery.classType, id);
        final response = await Amplify.API.query(request: request).response;
        final recovery = response.data;
        if (recovery == null) {
          log('errors: ${response.errors}');
        }
        log('get record by id completed');
        return recovery;
    } on ApiException catch (e) {
        log('Query failed: $e');
        return null;
    }
  }
}