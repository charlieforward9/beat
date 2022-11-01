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


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _email;
  final String? _firstName;
  final List<Goal>? _goals;
  final String? _lastName;
  final GenderTypes? _gender;
  final TemporalDate? _birthDate;
  final String? _avatar;
  final Integrations? _integration;
  final DefaultTargets? _targets;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _userIntegrationId;
  final String? _userTargetsId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get firstName {
    try {
      return _firstName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Goal>? get goals {
    return _goals;
  }
  
  String get lastName {
    try {
      return _lastName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  GenderTypes get gender {
    try {
      return _gender!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDate get birthDate {
    try {
      return _birthDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get avatar {
    try {
      return _avatar!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Integrations? get integration {
    return _integration;
  }
  
  DefaultTargets get targets {
    try {
      return _targets!;
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
  
  String? get userIntegrationId {
    return _userIntegrationId;
  }
  
  String get userTargetsId {
    try {
      return _userTargetsId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const User._internal({required this.id, required email, required firstName, goals, required lastName, required gender, required birthDate, required avatar, integration, required targets, createdAt, updatedAt, userIntegrationId, required userTargetsId}): _email = email, _firstName = firstName, _goals = goals, _lastName = lastName, _gender = gender, _birthDate = birthDate, _avatar = avatar, _integration = integration, _targets = targets, _createdAt = createdAt, _updatedAt = updatedAt, _userIntegrationId = userIntegrationId, _userTargetsId = userTargetsId;
  
  factory User({String? id, required String email, required String firstName, List<Goal>? goals, required String lastName, required GenderTypes gender, required TemporalDate birthDate, required String avatar, Integrations? integration, required DefaultTargets targets, String? userIntegrationId, required String userTargetsId}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      email: email,
      firstName: firstName,
      goals: goals != null ? List<Goal>.unmodifiable(goals) : goals,
      lastName: lastName,
      gender: gender,
      birthDate: birthDate,
      avatar: avatar,
      integration: integration,
      targets: targets,
      userIntegrationId: userIntegrationId,
      userTargetsId: userTargetsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _email == other._email &&
      _firstName == other._firstName &&
      DeepCollectionEquality().equals(_goals, other._goals) &&
      _lastName == other._lastName &&
      _gender == other._gender &&
      _birthDate == other._birthDate &&
      _avatar == other._avatar &&
      _integration == other._integration &&
      _targets == other._targets &&
      _userIntegrationId == other._userIntegrationId &&
      _userTargetsId == other._userTargetsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("gender=" + (_gender != null ? enumToString(_gender)! : "null") + ", ");
    buffer.write("birthDate=" + (_birthDate != null ? _birthDate!.format() : "null") + ", ");
    buffer.write("avatar=" + "$_avatar" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("userIntegrationId=" + "$_userIntegrationId" + ", ");
    buffer.write("userTargetsId=" + "$_userTargetsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? email, String? firstName, List<Goal>? goals, String? lastName, GenderTypes? gender, TemporalDate? birthDate, String? avatar, Integrations? integration, DefaultTargets? targets, String? userIntegrationId, String? userTargetsId}) {
    return User._internal(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      goals: goals ?? this.goals,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      avatar: avatar ?? this.avatar,
      integration: integration ?? this.integration,
      targets: targets ?? this.targets,
      userIntegrationId: userIntegrationId ?? this.userIntegrationId,
      userTargetsId: userTargetsId ?? this.userTargetsId);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _firstName = json['firstName'],
      _goals = json['goals'] is List
        ? (json['goals'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Goal.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _lastName = json['lastName'],
      _gender = enumFromString<GenderTypes>(json['gender'], GenderTypes.values),
      _birthDate = json['birthDate'] != null ? TemporalDate.fromString(json['birthDate']) : null,
      _avatar = json['avatar'],
      _integration = json['integration']?['serializedData'] != null
        ? Integrations.fromJson(new Map<String, dynamic>.from(json['integration']['serializedData']))
        : null,
      _targets = json['targets']?['serializedData'] != null
        ? DefaultTargets.fromJson(new Map<String, dynamic>.from(json['targets']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _userIntegrationId = json['userIntegrationId'],
      _userTargetsId = json['userTargetsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'firstName': _firstName, 'goals': _goals?.map((Goal? e) => e?.toJson()).toList(), 'lastName': _lastName, 'gender': enumToString(_gender), 'birthDate': _birthDate?.format(), 'avatar': _avatar, 'integration': _integration?.toJson(), 'targets': _targets?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'userIntegrationId': _userIntegrationId, 'userTargetsId': _userTargetsId
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'email': _email, 'firstName': _firstName, 'goals': _goals, 'lastName': _lastName, 'gender': _gender, 'birthDate': _birthDate, 'avatar': _avatar, 'integration': _integration, 'targets': _targets, 'createdAt': _createdAt, 'updatedAt': _updatedAt, 'userIntegrationId': _userIntegrationId, 'userTargetsId': _userTargetsId
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField GOALS = QueryField(
    fieldName: "goals",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Goal).toString()));
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField BIRTHDATE = QueryField(fieldName: "birthDate");
  static final QueryField AVATAR = QueryField(fieldName: "avatar");
  static final QueryField INTEGRATION = QueryField(
    fieldName: "integration",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Integrations).toString()));
  static final QueryField TARGETS = QueryField(
    fieldName: "targets",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (DefaultTargets).toString()));
  static final QueryField USERINTEGRATIONID = QueryField(fieldName: "userIntegrationId");
  static final QueryField USERTARGETSID = QueryField(fieldName: "userTargetsId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.FIRSTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.GOALS,
      isRequired: false,
      ofModelName: (Goal).toString(),
      associatedKey: Goal.USEROFGOAL
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LASTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.GENDER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.BIRTHDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.AVATAR,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: User.INTEGRATION,
      isRequired: false,
      ofModelName: (Integrations).toString(),
      associatedKey: Integrations.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: User.TARGETS,
      isRequired: true,
      ofModelName: (DefaultTargets).toString(),
      associatedKey: DefaultTargets.ID
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERINTEGRATIONID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERTARGETSID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}