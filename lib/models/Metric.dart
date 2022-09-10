/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Metric type in your schema. */
@immutable
class Metric extends Model {
  static const classType = const _MetricModelType();
  final String id;
  final TemporalDateTime? _utcDateTime;
  final String? _localDateTime;
  final String? _metricLocation;
  final int? _metricHeartRate;
  final List<ActivityMetric>? _activities;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime get utcDateTime {
    try {
      return _utcDateTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get localDateTime {
    try {
      return _localDateTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get metricLocation {
    return _metricLocation;
  }
  
  int? get metricHeartRate {
    return _metricHeartRate;
  }
  
  List<ActivityMetric>? get activities {
    return _activities;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Metric._internal({required this.id, required utcDateTime, required localDateTime, metricLocation, metricHeartRate, activities, createdAt, updatedAt}): _utcDateTime = utcDateTime, _localDateTime = localDateTime, _metricLocation = metricLocation, _metricHeartRate = metricHeartRate, _activities = activities, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Metric({String? id, required TemporalDateTime utcDateTime, required String localDateTime, String? metricLocation, int? metricHeartRate, List<ActivityMetric>? activities}) {
    return Metric._internal(
      id: id == null ? UUID.getUUID() : id,
      utcDateTime: utcDateTime,
      localDateTime: localDateTime,
      metricLocation: metricLocation,
      metricHeartRate: metricHeartRate,
      activities: activities != null ? List<ActivityMetric>.unmodifiable(activities) : activities);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Metric &&
      id == other.id &&
      _utcDateTime == other._utcDateTime &&
      _localDateTime == other._localDateTime &&
      _metricLocation == other._metricLocation &&
      _metricHeartRate == other._metricHeartRate &&
      DeepCollectionEquality().equals(_activities, other._activities);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Metric {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("utcDateTime=" + (_utcDateTime != null ? _utcDateTime!.format() : "null") + ", ");
    buffer.write("localDateTime=" + "$_localDateTime" + ", ");
    buffer.write("metricLocation=" + "$_metricLocation" + ", ");
    buffer.write("metricHeartRate=" + (_metricHeartRate != null ? _metricHeartRate!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Metric copyWith({String? id, TemporalDateTime? utcDateTime, String? localDateTime, String? metricLocation, int? metricHeartRate, List<ActivityMetric>? activities}) {
    return Metric._internal(
      id: id ?? this.id,
      utcDateTime: utcDateTime ?? this.utcDateTime,
      localDateTime: localDateTime ?? this.localDateTime,
      metricLocation: metricLocation ?? this.metricLocation,
      metricHeartRate: metricHeartRate ?? this.metricHeartRate,
      activities: activities ?? this.activities);
  }
  
  Metric.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _utcDateTime = json['utcDateTime'] != null ? TemporalDateTime.fromString(json['utcDateTime']) : null,
      _localDateTime = json['localDateTime'],
      _metricLocation = json['metricLocation'],
      _metricHeartRate = (json['metricHeartRate'] as num?)?.toInt(),
      _activities = json['activities'] is List
        ? (json['activities'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ActivityMetric.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'utcDateTime': _utcDateTime?.format(), 'localDateTime': _localDateTime, 'metricLocation': _metricLocation, 'metricHeartRate': _metricHeartRate, 'activities': _activities?.map((ActivityMetric? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "metric.id");
  static final QueryField UTCDATETIME = QueryField(fieldName: "utcDateTime");
  static final QueryField LOCALDATETIME = QueryField(fieldName: "localDateTime");
  static final QueryField METRICLOCATION = QueryField(fieldName: "metricLocation");
  static final QueryField METRICHEARTRATE = QueryField(fieldName: "metricHeartRate");
  static final QueryField ACTIVITIES = QueryField(
    fieldName: "activities",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ActivityMetric).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Metric";
    modelSchemaDefinition.pluralName = "Metrics";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Metric.UTCDATETIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Metric.LOCALDATETIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Metric.METRICLOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Metric.METRICHEARTRATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Metric.ACTIVITIES,
      isRequired: false,
      ofModelName: (ActivityMetric).toString(),
      associatedKey: ActivityMetric.METRIC
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _MetricModelType extends ModelType<Metric> {
  const _MetricModelType();
  
  @override
  Metric fromJson(Map<String, dynamic> jsonData) {
    return Metric.fromJson(jsonData);
  }
}