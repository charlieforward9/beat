class SleepWidgetModel {
  final String name;
  final double percentage;

  SleepWidgetModel({required this.name, required this.percentage});

  factory SleepWidgetModel.fromJson(Map<String, dynamic> json) {
    return SleepWidgetModel(
      name: json['name'],
      percentage: json['percentage'],
    );
  }
}