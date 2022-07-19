import 'package:amplify_flutter/amplify_flutter.dart';
import '../../../models/ModelProvider.dart';

class MetricRepository {
  DateTime now = DateTime.now();

  Future<void> newMetric(String _location, int _heartRate) async {
    final newMetric = Metric(
        metricTimestamp: TemporalDateTime(
            DateTime(now.year, now.month, now.day, 23, 59, 59, 59)),
        metricLocation: _location,
        metricHeartRate: _heartRate);
    await Amplify.DataStore.save(newMetric);
  }

  Future<Metric> getMetricById(String userId) async {
    final record = await Amplify.DataStore.query(Metric.classType,
        where: Metric.ID.eq(userId));
    return record.first;
  }
}
