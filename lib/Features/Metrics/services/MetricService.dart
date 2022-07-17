import '../../../models/ModelProvider.dart';
import '../repository/MetricRepository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class MetricService {
  MetricRepository metricRepository = MetricRepository();

  void createMetric(String _location, int _heartRate) {
    metricRepository.newMetric(_location, _heartRate);
  }

  Future<Metric> getMetric(String userId) {
    return metricRepository.getMetricById(userId);
  }

  Future<TemporalDateTime> getMetricTimestamp(String userId) async {
    Metric record = await metricRepository.getMetricById(userId);
    return record.metricTimestamp;
  }

  Future<String> getMetricLocation(String userId) async {
    Metric record = await metricRepository.getMetricById(userId);
    return record.metricLocation!;
  }

  Future<int> getMetricHeartRate(String userId) async {
    Metric record = await metricRepository.getMetricById(userId);
    return record.metricHeartRate!;
  }
}
