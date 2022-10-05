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

/** This is an auto generated class representing the Activity type in your schema. */
@immutable
class Activity extends Model {
  static const classType = const _ActivityModelType();
  final String id;
  final TemporalDateTime? _utcStart;
  final String? _localStart;
  final CategoryTypes? _activityCategory;
  final DurationBeat? _activityDuration;
  final String? _goalOfActivity;
  final Goal? _activityOfGoal;
  final List<ActivityMetric>? _activityMetrics;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  TemporalDateTime get utcStart {
    try {
      return _utcStart!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get localStart {
    try {
      return _localStart!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  CategoryTypes get activityCategory {
    try {
      return _activityCategory!;
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

  String get goalOfActivity {
    try {
      return _goalOfActivity!;
    } catch (e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  Goal? get activityOfGoal {
    return _activityOfGoal;
  }

  List<ActivityMetric>? get activityMetrics {
    return _activityMetrics;
  }

  TemporalDateTime? get createdAt {
    return _createdAt;
  }

  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Activity._internal(
      {required this.id,
      required utcStart,
      required localStart,
      required activityCategory,
      required activityDuration,
      required goalOfActivity,
      activityOfGoal,
      activityMetrics,
      createdAt,
      updatedAt})
      : _utcStart = utcStart,
        _localStart = localStart,
        _activityCategory = activityCategory,
        _activityDuration = activityDuration,
        _goalOfActivity = goalOfActivity,
        _activityOfGoal = activityOfGoal,
        _activityMetrics = activityMetrics,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Activity(
      {String? id,
      required TemporalDateTime utcStart,
      required String localStart,
      required CategoryTypes activityCategory,
      required DurationBeat activityDuration,
      required String goalOfActivity,
      Goal? activityOfGoal,
      List<ActivityMetric>? activityMetrics}) {
    return Activity._internal(
        id: id == null ? UUID.getUUID() : id,
        utcStart: utcStart,
        localStart: localStart,
        activityCategory: activityCategory,
        activityDuration: activityDuration,
        goalOfActivity: goalOfActivity,
        activityOfGoal: activityOfGoal,
        activityMetrics: activityMetrics != null
            ? List<ActivityMetric>.unmodifiable(activityMetrics)
            : activityMetrics);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Activity &&
        id == other.id &&
        _utcStart == other._utcStart &&
        _localStart == other._localStart &&
        _activityCategory == other._activityCategory &&
        _activityDuration == other._activityDuration &&
        _goalOfActivity == other._goalOfActivity &&
        _activityOfGoal == other._activityOfGoal &&
        DeepCollectionEquality()
            .equals(_activityMetrics, other._activityMetrics);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Activity {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("utcStart=" +
        (_utcStart != null ? _utcStart!.format() : "null") +
        ", ");
    buffer.write("localStart=" + "$_localStart" + ", ");
    buffer.write("activityCategory=" +
        (_activityCategory != null
            ? enumToString(_activityCategory)!
            : "null") +
        ", ");
    buffer.write("activityDuration=" +
        (_activityDuration != null ? _activityDuration!.toString() : "null") +
        ", ");
    buffer.write("goalOfActivity=" + "$_goalOfActivity" + ", ");
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
      TemporalDateTime? utcStart,
      String? localStart,
      CategoryTypes? activityCategory,
      DurationBeat? activityDuration,
      String? goalOfActivity,
      Goal? activityOfGoal,
      List<ActivityMetric>? activityMetrics}) {
    return Activity._internal(
        id: id ?? this.id,
        utcStart: utcStart ?? this.utcStart,
        localStart: localStart ?? this.localStart,
        activityCategory: activityCategory ?? this.activityCategory,
        activityDuration: activityDuration ?? this.activityDuration,
        goalOfActivity: goalOfActivity ?? this.goalOfActivity,
        activityOfGoal: activityOfGoal ?? this.activityOfGoal,
        activityMetrics: activityMetrics ?? this.activityMetrics);
  }

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _utcStart = json['utcStart'] != null
            ? TemporalDateTime.fromString(json['utcStart'])
            : null,
        _localStart = json['localStart'],
        _activityCategory = enumFromString<CategoryTypes>(
            json['activityCategory'], CategoryTypes.values),
        _activityDuration = json['activityDuration']?['serializedData'] != null
            ? DurationBeat.fromJson(new Map<String, dynamic>.from(
                json['activityDuration']['serializedData']))
            : null,
        _goalOfActivity = json['goalOfActivity'],
        _activityOfGoal = json['activityOfGoal']?['serializedData'] != null
            ? Goal.fromJson(new Map<String, dynamic>.from(
                json['activityOfGoal']['serializedData']))
            : null,
        _activityMetrics = json['activityMetrics'] is List
            ? (json['activityMetrics'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => ActivityMetric.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'utcStart': _utcStart?.format(),
        'localStart': _localStart,
        'activityCategory': enumToString(_activityCategory),
        'activityDuration': _activityDuration?.toJson(),
        'goalOfActivity': _goalOfActivity,
        'activityOfGoal': _activityOfGoal?.toJson(),
        'activityMetrics':
            _activityMetrics?.map((ActivityMetric? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField UTCSTART = QueryField(fieldName: "utcStart");
  static final QueryField LOCALSTART = QueryField(fieldName: "localStart");
  static final QueryField ACTIVITYCATEGORY =
      QueryField(fieldName: "activityCategory");
  static final QueryField ACTIVITYDURATION =
      QueryField(fieldName: "activityDuration");
  static final QueryField GOALOFACTIVITY =
      QueryField(fieldName: "goalOfActivity");
  static final QueryField ACTIVITYOFGOAL = QueryField(
      fieldName: "activityOfGoal",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Goal).toString()));
  static final QueryField ACTIVITYMETRICS = QueryField(
      fieldName: "activityMetrics",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ActivityMetric).toString()));
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

    // modelSchemaDefinition.indexes = [
    //   ModelIndex(fields: const ["goalOfActivity"], name: "byGoal")
    // ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.UTCSTART,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.LOCALSTART,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.ACTIVITYCATEGORY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        fieldName: 'activityDuration',
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'DurationBeat')));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Activity.GOALOFACTIVITY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Activity.ACTIVITYOFGOAL,
        isRequired: false,
        targetName: "goalGoalActivitiesId",
        ofModelName: (Goal).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Activity.ACTIVITYMETRICS,
        isRequired: false,
        ofModelName: (ActivityMetric).toString(),
        associatedKey: ActivityMetric.ACTIVITY));

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
