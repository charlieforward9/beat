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

/** This is an auto generated class representing the Activity type in your schema. */
@immutable
class Activity extends Model {
  static const classType = const _ActivityModelType();
  final String id;
  final TemporalDateTime? _activityStart;
  final TemporalDateTime? _activityEnd;
  final CategoryTypes? _activtyCategory;
  final DurationBeat? _activityDuration;
  final String? _goalID;
  final List<ActivityMetric>? _activityMetrics;
  final Goal? _activityOfGoal;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  TemporalDateTime get activityStart {
    try {
      return _activityStart!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  TemporalDateTime get activityEnd {
    try {
      return _activityEnd!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  CategoryTypes get activtyCategory {
    try {
      return _activtyCategory!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  DurationBeat get activityDuration {
    try {
      return _activityDuration!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get goalID {
    try {
      return _goalID!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  List<ActivityMetric>? get activityMetrics {
    return _activityMetrics;
  }

  Goal? get activityOfGoal {
    return _activityOfGoal;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Activity._internal(
      {required this.id,
      required activityStart,
      required activityEnd,
      required activtyCategory,
      required activityDuration,
      required goalID,
      activityMetrics,
      activityOfGoal,
      createdAt,
      updatedAt})
      : _activityStart = activityStart,
        _activityEnd = activityEnd,
        _activtyCategory = activtyCategory,
        _activityDuration = activityDuration,
        _goalID = goalID,
        _activityMetrics = activityMetrics,
        _activityOfGoal = activityOfGoal,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Activity(
      {String? id,
      required TemporalDateTime activityStart,
      required TemporalDateTime activityEnd,
      required CategoryTypes activtyCategory,
      required DurationBeat activityDuration,
      required String goalID,
      List<ActivityMetric>? activityMetrics,
      Goal? activityOfGoal}) {
    return Activity._internal(
        id: id == null ? UUID.getUUID() : id,
        activityStart: activityStart,
        activityEnd: activityEnd,
        activtyCategory: activtyCategory,
        activityDuration: activityDuration,
        goalID: goalID,
        activityMetrics: activityMetrics != null
            ? List<ActivityMetric>.unmodifiable(activityMetrics)
            : activityMetrics,
        activityOfGoal: activityOfGoal);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Activity &&
        id == other.id &&
        _activityStart == other._activityStart &&
        _activityEnd == other._activityEnd &&
        _activtyCategory == other._activtyCategory &&
        _activityDuration == other._activityDuration &&
        _goalID == other._goalID &&
        DeepCollectionEquality()
            .equals(_activityMetrics, other._activityMetrics) &&
        _activityOfGoal == other._activityOfGoal;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Activity {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("activityStart=" +
        (_activityStart != null ? _activityStart!.format() : "null") +
        ", ");
    buffer.write("activityEnd=" +
        (_activityEnd != null ? _activityEnd!.format() : "null") +
        ", ");
    buffer.write("activtyCategory=" +
        (_activtyCategory != null ? enumToString(_activtyCategory)! : "null") +
        ", ");
    buffer.write("activityDuration=" +
        (_activityDuration != null ? _activityDuration!.toString() : "null") +
        ", ");
    buffer.write("goalID=" + "$_goalID" + ", ");
    buffer.write("activityOfGoal=" +
        (_activityOfGoal != null ? _activityOfGoal!.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Activity copyWith(
      {String? id,
      TemporalDateTime? activityStart,
      TemporalDateTime? activityEnd,
      CategoryTypes? activtyCategory,
      DurationBeat? activityDuration,
      String? goalID,
      List<ActivityMetric>? activityMetrics,
      Goal? activityOfGoal}) {
    return Activity._internal(
        id: id ?? this.id,
        activityStart: activityStart ?? this.activityStart,
        activityEnd: activityEnd ?? this.activityEnd,
        activtyCategory: activtyCategory ?? this.activtyCategory,
        activityDuration: activityDuration ?? this.activityDuration,
        goalID: goalID ?? this.goalID,
        activityMetrics: activityMetrics ?? this.activityMetrics,
        activityOfGoal: activityOfGoal ?? this.activityOfGoal);
  }

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _activityStart = json['activityStart'] != null
            ? TemporalDateTime.fromString(json['activityStart'])
            : null,
        _activityEnd = json['activityEnd'] != null
            ? TemporalDateTime.fromString(json['activityEnd'])
            : null,
        _activtyCategory = enumFromString<CategoryTypes>(
            json['activtyCategory'], CategoryTypes.values),
        _activityDuration = json['activityDuration']?['serializedData'] != null
            ? DurationBeat.fromJson(new Map<String, dynamic>.from(
                json['activityDuration']['serializedData']))
            : null,
        _goalID = json['goalID'],
        _activityMetrics = json['activityMetrics'] is List
            ? (json['activityMetrics'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => ActivityMetric.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _activityOfGoal = json['activityOfGoal']?['serializedData'] != null
            ? Goal.fromJson(new Map<String, dynamic>.from(
                json['activityOfGoal']['serializedData']))
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'activityStart': _activityStart?.format(),
        'activityEnd': _activityEnd?.format(),
        'activtyCategory': enumToString(_activtyCategory),
        'activityDuration': _activityDuration?.toJson(),
        'goalID': _goalID,
        'activityMetrics':
            _activityMetrics?.map((ActivityMetric? e) => e?.toJson()).toList(),
        'activityOfGoal': _activityOfGoal?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "activity.id");
  static final QueryField ACTIVITYSTART =
      QueryField(fieldName: "activityStart");
  static final QueryField ACTIVITYEND = QueryField(fieldName: "activityEnd");
  static final QueryField ACTIVTYCATEGORY =
      QueryField(fieldName: "activtyCategory");
  static final QueryField ACTIVITYDURATION =
      QueryField(fieldName: "activityDuration");
  static final QueryField GOALID = QueryField(fieldName: "goalID");
  static final QueryField ACTIVITYMETRICS = QueryField(
      fieldName: "activityMetrics",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ActivityMetric).toString()));
  static final QueryField ACTIVITYOFGOAL = QueryField(
      fieldName: "activityOfGoal",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Goal).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Activity";
    modelSchemaDefinition.pluralName = "Activities";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.ACTIVITYSTART,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.ACTIVITYEND,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.ACTIVTYCATEGORY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'activityDuration',
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'DurationBeat')));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.GOALID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Activity.ACTIVITYMETRICS,
        isRequired: false,
        ofModelName: (ActivityMetric).toString(),
        associatedKey: ActivityMetric.ACTIVITY));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Activity.ACTIVITYOFGOAL,
        isRequired: false,
        targetName: "goalGoalActivitiesId",
        ofModelName: (Goal).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'createdAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        fieldName: 'updatedAt',
        isRequired: false,
        isReadOnly: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _ActivityModelType extends ModelType<Activity> {
  const _ActivityModelType();

  @override
  Activity fromJson(Map<String, dynamic> jsonData) {
    return Activity.fromJson(jsonData);
  }
}
