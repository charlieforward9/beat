import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../models/ModelProvider.dart';

class MetricRepository {

  Future<void> createMetric(Metric metric) async {
    await Amplify.DataStore.save(metric);
  }

}
