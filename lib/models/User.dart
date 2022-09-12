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
  final String? _userEmail;
  final String? _userName;
  final String? _userPassword;
  final String? _userFirstName;
  final List<Goal>? _userGoals;
  final String? _userLastName;
  final GenderTypes? _userGender;
  final TemporalDate? _userBirthDate;
  final String? _userAvatar;
  final Integrations? _userIntegrations;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;
  final String? _userUserIntegrationsId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get userEmail {
    try {
      return _userEmail!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userName {
    try {
      return _userName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userPassword {
    try {
      return _userPassword!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userFirstName {
    try {
      return _userFirstName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Goal>? get userGoals {
    return _userGoals;
  }
  
  String get userLastName {
    try {
      return _userLastName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  GenderTypes get userGender {
    try {
      return _userGender!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDate get userBirthDate {
    try {
      return _userBirthDate!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userAvatar {
    try {
      return _userAvatar!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Integrations? get userIntegrations {
    return _userIntegrations;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get userUserIntegrationsId {
    return _userUserIntegrationsId;
  }
  
  const User._internal({required this.id, required userEmail, required userName, required userPassword, required userFirstName, userGoals, required userLastName, required userGender, required userBirthDate, required userAvatar, userIntegrations, createdAt, updatedAt, userUserIntegrationsId}): _userEmail = userEmail, _userName = userName, _userPassword = userPassword, _userFirstName = userFirstName, _userGoals = userGoals, _userLastName = userLastName, _userGender = userGender, _userBirthDate = userBirthDate, _userAvatar = userAvatar, _userIntegrations = userIntegrations, _createdAt = createdAt, _updatedAt = updatedAt, _userUserIntegrationsId = userUserIntegrationsId;
  
  factory User({String? id, required String userEmail, required String userName, required String userPassword, required String userFirstName, List<Goal>? userGoals, required String userLastName, required GenderTypes userGender, required TemporalDate userBirthDate, required String userAvatar, Integrations? userIntegrations, String? userUserIntegrationsId}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      userEmail: userEmail,
      userName: userName,
      userPassword: userPassword,
      userFirstName: userFirstName,
      userGoals: userGoals != null ? List<Goal>.unmodifiable(userGoals) : userGoals,
      userLastName: userLastName,
      userGender: userGender,
      userBirthDate: userBirthDate,
      userAvatar: userAvatar,
      userIntegrations: userIntegrations,
      userUserIntegrationsId: userUserIntegrationsId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _userEmail == other._userEmail &&
      _userName == other._userName &&
      _userPassword == other._userPassword &&
      _userFirstName == other._userFirstName &&
      DeepCollectionEquality().equals(_userGoals, other._userGoals) &&
      _userLastName == other._userLastName &&
      _userGender == other._userGender &&
      _userBirthDate == other._userBirthDate &&
      _userAvatar == other._userAvatar &&
      _userIntegrations == other._userIntegrations &&
      _userUserIntegrationsId == other._userUserIntegrationsId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userEmail=" + "$_userEmail" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("userPassword=" + "$_userPassword" + ", ");
    buffer.write("userFirstName=" + "$_userFirstName" + ", ");
    buffer.write("userLastName=" + "$_userLastName" + ", ");
    buffer.write("userGender=" + (_userGender != null ? enumToString(_userGender)! : "null") + ", ");
    buffer.write("userBirthDate=" + (_userBirthDate != null ? _userBirthDate!.format() : "null") + ", ");
    buffer.write("userAvatar=" + "$_userAvatar" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("userUserIntegrationsId=" + "$_userUserIntegrationsId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? userEmail, String? userName, String? userPassword, String? userFirstName, List<Goal>? userGoals, String? userLastName, GenderTypes? userGender, TemporalDate? userBirthDate, String? userAvatar, Integrations? userIntegrations, String? userUserIntegrationsId}) {
    return User._internal(
      id: id ?? this.id,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
      userFirstName: userFirstName ?? this.userFirstName,
      userGoals: userGoals ?? this.userGoals,
      userLastName: userLastName ?? this.userLastName,
      userGender: userGender ?? this.userGender,
      userBirthDate: userBirthDate ?? this.userBirthDate,
      userAvatar: userAvatar ?? this.userAvatar,
      userIntegrations: userIntegrations ?? this.userIntegrations,
      userUserIntegrationsId: userUserIntegrationsId ?? this.userUserIntegrationsId);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userEmail = json['userEmail'],
      _userName = json['userName'],
      _userPassword = json['userPassword'],
      _userFirstName = json['userFirstName'],
      _userGoals = json['userGoals'] is List
        ? (json['userGoals'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Goal.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _userLastName = json['userLastName'],
      _userGender = enumFromString<GenderTypes>(json['userGender'], GenderTypes.values),
      _userBirthDate = json['userBirthDate'] != null ? TemporalDate.fromString(json['userBirthDate']) : null,
      _userAvatar = json['userAvatar'],
      _userIntegrations = json['userIntegrations']?['serializedData'] != null
        ? Integrations.fromJson(new Map<String, dynamic>.from(json['userIntegrations']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null,
      _userUserIntegrationsId = json['userUserIntegrationsId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userEmail': _userEmail, 'userName': _userName, 'userPassword': _userPassword, 'userFirstName': _userFirstName, 'userGoals': _userGoals?.map((Goal? e) => e?.toJson()).toList(), 'userLastName': _userLastName, 'userGender': enumToString(_userGender), 'userBirthDate': _userBirthDate?.format(), 'userAvatar': _userAvatar, 'userIntegrations': _userIntegrations?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'userUserIntegrationsId': _userUserIntegrationsId
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USEREMAIL = QueryField(fieldName: "userEmail");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField USERPASSWORD = QueryField(fieldName: "userPassword");
  static final QueryField USERFIRSTNAME = QueryField(fieldName: "userFirstName");
  static final QueryField USERGOALS = QueryField(
    fieldName: "userGoals",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Goal).toString()));
  static final QueryField USERLASTNAME = QueryField(fieldName: "userLastName");
  static final QueryField USERGENDER = QueryField(fieldName: "userGender");
  static final QueryField USERBIRTHDATE = QueryField(fieldName: "userBirthDate");
  static final QueryField USERAVATAR = QueryField(fieldName: "userAvatar");
  static final QueryField USERINTEGRATIONS = QueryField(
    fieldName: "userIntegrations",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Integrations).toString()));
  static final QueryField USERUSERINTEGRATIONSID = QueryField(fieldName: "userUserIntegrationsId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: User.USEREMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERPASSWORD,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERFIRSTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.USERGOALS,
      isRequired: false,
      ofModelName: (Goal).toString(),
      associatedKey: Goal.USEROFGOAL
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERLASTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERGENDER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERBIRTHDATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERAVATAR,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: User.USERINTEGRATIONS,
      isRequired: false,
      ofModelName: (Integrations).toString(),
      associatedKey: Integrations.ID
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
      key: User.USERUSERINTEGRATIONSID,
      isRequired: false,
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