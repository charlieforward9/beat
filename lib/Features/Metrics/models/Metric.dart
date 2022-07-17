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

import '../../../models/ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Metric type in your schema. */
@immutable
class Metric extends Model {
  static const classType = const _MetricModelType();
  final String id;
  final TemporalDateTime? _metricTimestamp;
  final String? _metricLocation;
  final List<MetricActivity>? _metricActivities;
  final int? _metricHeartRate;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDateTime get metricTimestamp {
    try {
      return _metricTimestamp!;
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
  
  List<MetricActivity>? get metricActivities {
    return _metricActivities;
  }
  
  int? get metricHeartRate {
    return _metricHeartRate;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Metric._internal({required this.id, required metricTimestamp, metricLocation, metricActivities, metricHeartRate, createdAt, updatedAt}): _metricTimestamp = metricTimestamp, _metricLocation = metricLocation, _metricActivities = metricActivities, _metricHeartRate = metricHeartRate, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Metric({String? id, required TemporalDateTime metricTimestamp, String? metricLocation, List<MetricActivity>? metricActivities, int? metricHeartRate}) {
    return Metric._internal(
      id: id == null ? UUID.getUUID() : id,
      metricTimestamp: metricTimestamp,
      metricLocation: metricLocation,
      metricActivities: metricActivities != null ? List<MetricActivity>.unmodifiable(metricActivities) : metricActivities,
      metricHeartRate: metricHeartRate);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Metric &&
      id == other.id &&
      _metricTimestamp == other._metricTimestamp &&
      _metricLocation == other._metricLocation &&
      DeepCollectionEquality().equals(_metricActivities, other._metricActivities) &&
      _metricHeartRate == other._metricHeartRate;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Metric {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("metricTimestamp=" + (_metricTimestamp != null ? _metricTimestamp!.format() : "null") + ", ");
    buffer.write("metricLocation=" + "$_metricLocation" + ", ");
    buffer.write("metricHeartRate=" + (_metricHeartRate != null ? _metricHeartRate!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Metric copyWith({String? id, TemporalDateTime? metricTimestamp, String? metricLocation, List<MetricActivity>? metricActivities, int? metricHeartRate}) {
    return Metric._internal(
      id: id ?? this.id,
      metricTimestamp: metricTimestamp ?? this.metricTimestamp,
      metricLocation: metricLocation ?? this.metricLocation,
      metricActivities: metricActivities ?? this.metricActivities,
      metricHeartRate: metricHeartRate ?? this.metricHeartRate);
  }
  
  Metric.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _metricTimestamp = json['metricTimestamp'] != null ? TemporalDateTime.fromString(json['metricTimestamp']) : null,
      _metricLocation = json['metricLocation'],
      _metricActivities = json['metricActivities'] is List
        ? (json['metricActivities'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => MetricActivity.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _metricHeartRate = (json['metricHeartRate'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'metricTimestamp': _metricTimestamp?.format(), 'metricLocation': _metricLocation, 'metricActivities': _metricActivities?.map((MetricActivity? e) => e?.toJson()).toList(), 'metricHeartRate': _metricHeartRate, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "metric.id");
  static final QueryField METRICTIMESTAMP = QueryField(fieldName: "metricTimestamp");
  static final QueryField METRICLOCATION = QueryField(fieldName: "metricLocation");
  static final QueryField METRICACTIVITIES = QueryField(
    fieldName: "metricActivities",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (MetricActivity).toString()));
  static final QueryField METRICHEARTRATE = QueryField(fieldName: "metricHeartRate");
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
      key: Metric.METRICTIMESTAMP,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Metric.METRICLOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Metric.METRICACTIVITIES,
      isRequired: false,
      ofModelName: (MetricActivity).toString(),
      associatedKey: MetricActivity.METRIC
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Metric.METRICHEARTRATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
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