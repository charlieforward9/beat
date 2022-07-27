import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../models/ModelProvider.dart';

class MetricRepository {
  DateTime now = DateTime.now();

  Future<void> newMetric(String _location, int _heartRate) async {
    final newMetric = Metric(
        metricTimestamp: TemporalDateTime(
            DateTime(now.year, now.month, now.day, now.day, now.minute, now.second)),
        metricLocation: _location,
        metricHeartRate: _heartRate);
    await Amplify.DataStore.save(newMetric);
  }

  Future<Metric> fetchMetricById(String userId) async {
    final record = await Amplify.DataStore.query(Metric.classType,
        where: Metric.ID.eq(userId));
    return record.first;
  }
}
