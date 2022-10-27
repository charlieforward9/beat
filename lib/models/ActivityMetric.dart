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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ActivityMetric type in your schema. */
@immutable
class ActivityMetric extends Model {
  static const classType = const _ActivityMetricModelType();
  final String id;
  final Activity? _activity;
  final Metric? _metric;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Activity get activity {
    try {
      return _activity!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Metric get metric {
    try {
      return _metric!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ActivityMetric._internal({required this.id, required activity, required metric, createdAt, updatedAt}): _activity = activity, _metric = metric, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ActivityMetric({String? id, required Activity activity, required Metric metric}) {
    return ActivityMetric._internal(
      id: id == null ? UUID.getUUID() : id,
      activity: activity,
      metric: metric);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityMetric &&
      id == other.id &&
      _activity == other._activity &&
      _metric == other._metric;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ActivityMetric {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("activity=" + (_activity != null ? _activity!.toString() : "null") + ", ");
    buffer.write("metric=" + (_metric != null ? _metric!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ActivityMetric copyWith({String? id, Activity? activity, Metric? metric}) {
    return ActivityMetric._internal(
      id: id ?? this.id,
      activity: activity ?? this.activity,
      metric: metric ?? this.metric);
  }
  
  ActivityMetric.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _activity = json['activity']?['serializedData'] != null
        ? Activity.fromJson(new Map<String, dynamic>.from(json['activity']['serializedData']))
        : null,
      _metric = json['metric']?['serializedData'] != null
        ? Metric.fromJson(new Map<String, dynamic>.from(json['metric']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'activity': _activity?.toJson(), 'metric': _metric?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'activity': _activity, 'metric': _metric, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField ACTIVITY = QueryField(
    fieldName: "activity",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Activity).toString()));
  static final QueryField METRIC = QueryField(
    fieldName: "metric",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Metric).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ActivityMetric";
    modelSchemaDefinition.pluralName = "ActivityMetrics";
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["activityID"], name: "byActivity"),
      ModelIndex(fields: const ["metricID"], name: "byMetric")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: ActivityMetric.ACTIVITY,
      isRequired: true,
      targetName: "activityID",
      ofModelName: (Activity).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: ActivityMetric.METRIC,
      isRequired: true,
      targetName: "metricID",
      ofModelName: (Metric).toString()
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

class _ActivityMetricModelType extends ModelType<ActivityMetric> {
  const _ActivityMetricModelType();
  
  @override
  ActivityMetric fromJson(Map<String, dynamic> jsonData) {
    return ActivityMetric.fromJson(jsonData);
  }
}