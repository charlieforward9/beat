
import 'dart:developer';

import 'package:beat/Features/Recovery/models/Recovery.dart';
import 'package:beat/Features/Recovery/repository/RecoveryRepository.dart';
import 'package:beat/Features/Recovery/services/RecoveryService.dart';
import 'package:beat/amplifyconfiguration.dart';
import 'package:beat/models/ModelProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';


void main(){

  // An example on how to implement the methods
  // All of the activites have the same structure
  RecoveryService  recoveryService = RecoveryService();

 test('new recovery record percentage', () async {
  String id = "c460788a-7519-49f6-baa0-81624b4d0748";
  double newPercentage = 100;
  recoveryService.resetGoal(id, newPercentage);
  });
}
