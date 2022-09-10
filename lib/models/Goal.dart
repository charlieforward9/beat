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


/** This is an auto generated class representing the Goal type in your schema. */
@immutable
class Goal extends Model {
  static const classType = const _GoalModelType();
  final String id;
  final TemporalDate? _utcDate;
  final String? _localDate;
  final DurationBeat? _goalCurrentDuration;
  final DurationBeat? _goalTargetDuration;
  final double? _goalPercentage;
  final CategoryTypes? _goalCategory;
  final List<Activity>? _goalActivities;
  final User? _goalOfUser;
  final String? _howToGetU;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDate get utcDate {
    try {
      return _utcDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get localDate {
    try {
      return _localDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DurationBeat get goalCurrentDuration {
    try {
      return _goalCurrentDuration!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DurationBeat get goalTargetDuration {
    try {
      return _goalTargetDuration!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double? get goalPercentage {
    return _goalPercentage;
  }
  
  CategoryTypes get goalCategory {
    try {
      return _goalCategory!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Activity>? get goalActivities {
    return _goalActivities;
  }
  
  User? get goalOfUser {
    return _goalOfUser;
  }
  
  String get howToGetU {
    try {
      return _howToGetU!;
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
  
  const Goal._internal({required this.id, required utcDate, required localDate, required goalCurrentDuration, required goalTargetDuration, goalPercentage, required goalCategory, goalActivities, goalOfUser, required howToGetU, createdAt, updatedAt}): _utcDate = utcDate, _localDate = localDate, _goalCurrentDuration = goalCurrentDuration, _goalTargetDuration = goalTargetDuration, _goalPercentage = goalPercentage, _goalCategory = goalCategory, _goalActivities = goalActivities, _goalOfUser = goalOfUser, _howToGetU = howToGetU, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Goal({String? id, required TemporalDate utcDate, required String localDate, required DurationBeat goalCurrentDuration, required DurationBeat goalTargetDuration, double? goalPercentage, required CategoryTypes goalCategory, List<Activity>? goalActivities, User? goalOfUser, required String howToGetU}) {
    return Goal._internal(
      id: id == null ? UUID.getUUID() : id,
      utcDate: utcDate,
      localDate: localDate,
      goalCurrentDuration: goalCurrentDuration,
      goalTargetDuration: goalTargetDuration,
      goalPercentage: goalPercentage,
      goalCategory: goalCategory,
      goalActivities: goalActivities != null ? List<Activity>.unmodifiable(goalActivities) : goalActivities,
      goalOfUser: goalOfUser,
      howToGetU: howToGetU);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Goal &&
      id == other.id &&
      _utcDate == other._utcDate &&
      _localDate == other._localDate &&
      _goalCurrentDuration == other._goalCurrentDuration &&
      _goalTargetDuration == other._goalTargetDuration &&
      _goalPercentage == other._goalPercentage &&
      _goalCategory == other._goalCategory &&
      DeepCollectionEquality().equals(_goalActivities, other._goalActivities) &&
      _goalOfUser == other._goalOfUser &&
      _howToGetU == other._howToGetU;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Goal {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("utcDate=" + (_utcDate != null ? _utcDate!.format() : "null") + ", ");
    buffer.write("localDate=" + "$_localDate" + ", ");
    buffer.write("goalCurrentDuration=" + (_goalCurrentDuration != null ? _goalCurrentDuration!.toString() : "null") + ", ");
    buffer.write("goalTargetDuration=" + (_goalTargetDuration != null ? _goalTargetDuration!.toString() : "null") + ", ");
    buffer.write("goalPercentage=" + (_goalPercentage != null ? _goalPercentage!.toString() : "null") + ", ");
    buffer.write("goalCategory=" + (_goalCategory != null ? enumToString(_goalCategory)! : "null") + ", ");
    buffer.write("goalOfUser=" + (_goalOfUser != null ? _goalOfUser!.toString() : "null") + ", ");
    buffer.write("howToGetU=" + "$_howToGetU" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Goal copyWith({String? id, TemporalDate? utcDate, String? localDate, DurationBeat? goalCurrentDuration, DurationBeat? goalTargetDuration, double? goalPercentage, CategoryTypes? goalCategory, List<Activity>? goalActivities, User? goalOfUser, String? howToGetU}) {
    return Goal._internal(
      id: id ?? this.id,
      utcDate: utcDate ?? this.utcDate,
      localDate: localDate ?? this.localDate,
      goalCurrentDuration: goalCurrentDuration ?? this.goalCurrentDuration,
      goalTargetDuration: goalTargetDuration ?? this.goalTargetDuration,
      goalPercentage: goalPercentage ?? this.goalPercentage,
      goalCategory: goalCategory ?? this.goalCategory,
      goalActivities: goalActivities ?? this.goalActivities,
      goalOfUser: goalOfUser ?? this.goalOfUser,
      howToGetU: howToGetU ?? this.howToGetU);
  }
  
  Goal.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _utcDate = json['utcDate'] != null ? TemporalDate.fromString(json['utcDate']) : null,
      _localDate = json['localDate'],
      _goalCurrentDuration = json['goalCurrentDuration']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['goalCurrentDuration']['serializedData']))
        : null,
      _goalTargetDuration = json['goalTargetDuration']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['goalTargetDuration']['serializedData']))
        : null,
      _goalPercentage = (json['goalPercentage'] as num?)?.toDouble(),
      _goalCategory = enumFromString<CategoryTypes>(json['goalCategory'], CategoryTypes.values),
      _goalActivities = json['goalActivities'] is List
        ? (json['goalActivities'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Activity.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _goalOfUser = json['goalOfUser']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['goalOfUser']['serializedData']))
        : null,
      _howToGetU = json['howToGetU'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'utcDate': _utcDate?.format(), 'localDate': _localDate, 'goalCurrentDuration': _goalCurrentDuration?.toJson(), 'goalTargetDuration': _goalTargetDuration?.toJson(), 'goalPercentage': _goalPercentage, 'goalCategory': enumToString(_goalCategory), 'goalActivities': _goalActivities?.map((Activity? e) => e?.toJson()).toList(), 'goalOfUser': _goalOfUser?.toJson(), 'howToGetU': _howToGetU, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "goal.id");
  static final QueryField UTCDATE = QueryField(fieldName: "utcDate");
  static final QueryField LOCALDATE = QueryField(fieldName: "localDate");
  static final QueryField GOALCURRENTDURATION = QueryField(fieldName: "goalCurrentDuration");
  static final QueryField GOALTARGETDURATION = QueryField(fieldName: "goalTargetDuration");
  static final QueryField GOALPERCENTAGE = QueryField(fieldName: "goalPercentage");
  static final QueryField GOALCATEGORY = QueryField(fieldName: "goalCategory");
  static final QueryField GOALACTIVITIES = QueryField(
    fieldName: "goalActivities",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Activity).toString()));
  static final QueryField GOALOFUSER = QueryField(
    fieldName: "goalOfUser",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField HOWTOGETU = QueryField(fieldName: "howToGetU");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Goal";
    modelSchemaDefinition.pluralName = "Goals";
    
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
      key: Goal.UTCDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Goal.LOCALDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'goalCurrentDuration',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DurationBeat')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'goalTargetDuration',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DurationBeat')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Goal.GOALPERCENTAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Goal.GOALCATEGORY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Goal.GOALACTIVITIES,
      isRequired: false,
      ofModelName: (Activity).toString(),
      associatedKey: Activity.HOWTOGETG
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Goal.GOALOFUSER,
      isRequired: false,
      targetName: "userUserGoalsId",
      ofModelName: (User).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Goal.HOWTOGETU,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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

class _GoalModelType extends ModelType<Goal> {
  const _GoalModelType();
  
  @override
  Goal fromJson(Map<String, dynamic> jsonData) {
    return Goal.fromJson(jsonData);
  }
}