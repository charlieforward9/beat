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
  final CategoryTypes? _goalCategory;
  final DurationBeat? _goalCurrentDuration;
  final DurationBeat? _goalTargetDuration;
  final double? _goalPercentage;
  final String? _userOfGoal;
  final User? _goalOfUser;
  final List<Activity>? _goalActivities;
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
  
  double get goalPercentage {
    try {
      return _goalPercentage!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userOfGoal {
    try {
      return _userOfGoal!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User? get goalOfUser {
    return _goalOfUser;
  }
  
  List<Activity>? get goalActivities {
    return _goalActivities;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Goal._internal({required this.id, required utcDate, required localDate, required goalCategory, required goalCurrentDuration, required goalTargetDuration, required goalPercentage, required userOfGoal, goalOfUser, goalActivities, createdAt, updatedAt}): _utcDate = utcDate, _localDate = localDate, _goalCategory = goalCategory, _goalCurrentDuration = goalCurrentDuration, _goalTargetDuration = goalTargetDuration, _goalPercentage = goalPercentage, _userOfGoal = userOfGoal, _goalOfUser = goalOfUser, _goalActivities = goalActivities, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Goal({String? id, required TemporalDate utcDate, required String localDate, required CategoryTypes goalCategory, required DurationBeat goalCurrentDuration, required DurationBeat goalTargetDuration, required double goalPercentage, required String userOfGoal, User? goalOfUser, List<Activity>? goalActivities}) {
    return Goal._internal(
      id: id == null ? UUID.getUUID() : id,
      utcDate: utcDate,
      localDate: localDate,
      goalCategory: goalCategory,
      goalCurrentDuration: goalCurrentDuration,
      goalTargetDuration: goalTargetDuration,
      goalPercentage: goalPercentage,
      userOfGoal: userOfGoal,
      goalOfUser: goalOfUser,
      goalActivities: goalActivities != null ? List<Activity>.unmodifiable(goalActivities) : goalActivities);
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
      _goalCategory == other._goalCategory &&
      _goalCurrentDuration == other._goalCurrentDuration &&
      _goalTargetDuration == other._goalTargetDuration &&
      _goalPercentage == other._goalPercentage &&
      _userOfGoal == other._userOfGoal &&
      _goalOfUser == other._goalOfUser &&
      DeepCollectionEquality().equals(_goalActivities, other._goalActivities);
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
    buffer.write("goalCategory=" + (_goalCategory != null ? enumToString(_goalCategory)! : "null") + ", ");
    buffer.write("goalCurrentDuration=" + (_goalCurrentDuration != null ? _goalCurrentDuration!.toString() : "null") + ", ");
    buffer.write("goalTargetDuration=" + (_goalTargetDuration != null ? _goalTargetDuration!.toString() : "null") + ", ");
    buffer.write("goalPercentage=" + (_goalPercentage != null ? _goalPercentage!.toString() : "null") + ", ");
    buffer.write("userOfGoal=" + "$_userOfGoal" + ", ");
    buffer.write("goalOfUser=" + (_goalOfUser != null ? _goalOfUser!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Goal copyWith({String? id, TemporalDate? utcDate, String? localDate, CategoryTypes? goalCategory, DurationBeat? goalCurrentDuration, DurationBeat? goalTargetDuration, double? goalPercentage, String? userOfGoal, User? goalOfUser, List<Activity>? goalActivities}) {
    return Goal._internal(
      id: id ?? this.id,
      utcDate: utcDate ?? this.utcDate,
      localDate: localDate ?? this.localDate,
      goalCategory: goalCategory ?? this.goalCategory,
      goalCurrentDuration: goalCurrentDuration ?? this.goalCurrentDuration,
      goalTargetDuration: goalTargetDuration ?? this.goalTargetDuration,
      goalPercentage: goalPercentage ?? this.goalPercentage,
      userOfGoal: userOfGoal ?? this.userOfGoal,
      goalOfUser: goalOfUser ?? this.goalOfUser,
      goalActivities: goalActivities ?? this.goalActivities);
  }
  
  Goal.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _utcDate = json['utcDate'] != null ? TemporalDate.fromString(json['utcDate']) : null,
      _localDate = json['localDate'],
      _goalCategory = enumFromString<CategoryTypes>(json['goalCategory'], CategoryTypes.values),
      _goalCurrentDuration = json['goalCurrentDuration']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['goalCurrentDuration']['serializedData']))
        : null,
      _goalTargetDuration = json['goalTargetDuration']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['goalTargetDuration']['serializedData']))
        : null,
      _goalPercentage = (json['goalPercentage'] as num?)?.toDouble(),
      _userOfGoal = json['userOfGoal'],
      _goalOfUser = json['goalOfUser']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['goalOfUser']['serializedData']))
        : null,
      _goalActivities = json['goalActivities'] is List
        ? (json['goalActivities'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Activity.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'utcDate': _utcDate?.format(), 'localDate': _localDate, 'goalCategory': enumToString(_goalCategory), 'goalCurrentDuration': _goalCurrentDuration?.toJson(), 'goalTargetDuration': _goalTargetDuration?.toJson(), 'goalPercentage': _goalPercentage, 'userOfGoal': _userOfGoal, 'goalOfUser': _goalOfUser?.toJson(), 'goalActivities': _goalActivities?.map((Activity? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "goal.id");
  static final QueryField UTCDATE = QueryField(fieldName: "utcDate");
  static final QueryField LOCALDATE = QueryField(fieldName: "localDate");
  static final QueryField GOALCATEGORY = QueryField(fieldName: "goalCategory");
  static final QueryField GOALCURRENTDURATION = QueryField(fieldName: "goalCurrentDuration");
  static final QueryField GOALTARGETDURATION = QueryField(fieldName: "goalTargetDuration");
  static final QueryField GOALPERCENTAGE = QueryField(fieldName: "goalPercentage");
  static final QueryField USEROFGOAL = QueryField(fieldName: "userOfGoal");
  static final QueryField GOALOFUSER = QueryField(
    fieldName: "goalOfUser",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField GOALACTIVITIES = QueryField(
    fieldName: "goalActivities",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Activity).toString()));
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Goal.GOALCATEGORY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
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
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Goal.USEROFGOAL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Goal.GOALOFUSER,
      isRequired: false,
      targetName: "userUserGoalsId",
      ofModelName: (User).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Goal.GOALACTIVITIES,
      isRequired: false,
      ofModelName: (Activity).toString(),
      associatedKey: Activity.GOALOFACTIVITY
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