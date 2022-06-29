import 'dart:developer';

import 'package:beat/Features/Recovery/models/Recovery.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class RecoveryService{
  Future<void> createRecovery(double value) async {
    try {
      final recovery = Recovery(percentage: 0.0, goal: value);
      final request = ModelMutations.create(recovery);
      final response = await Amplify.API.mutate(request: request).response;

      final createdRecovery = response.data;
      if (createdRecovery == null) {
        log('errors: ${response.errors}');
        return;
      }
      log('Mutation result: ${createdRecovery.percentage}');
    } on ApiException catch (e) {
      log('Mutation failed: $e');
    }
  }

  Future<void> updateRecoveryPercentage(Recovery originalrecovery, double newPercentage) async {
    final newRecoveryPercentage = originalrecovery.copyWith(percentage: newPercentage);
    log(newRecoveryPercentage.toString());
    final request = ModelMutations.update(newRecoveryPercentage);
    final response = await Amplify.API.mutate(request: request).response;
    log('Response: $response');
  }
}
