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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Integrations type in your schema. */
@immutable
class Integrations extends Model {
  static const classType = const _IntegrationsModelType();
  final String id;
  final String? _wf_profile_bearer;
  final String? _wf_public_id;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get wf_profile_bearer {
    try {
      return _wf_profile_bearer!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get wf_public_id {
    try {
      return _wf_public_id!;
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
  
  const Integrations._internal({required this.id, required wf_profile_bearer, required wf_public_id, createdAt, updatedAt}): _wf_profile_bearer = wf_profile_bearer, _wf_public_id = wf_public_id, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Integrations({String? id, required String wf_profile_bearer, required String wf_public_id}) {
    return Integrations._internal(
      id: id == null ? UUID.getUUID() : id,
      wf_profile_bearer: wf_profile_bearer,
      wf_public_id: wf_public_id);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Integrations &&
      id == other.id &&
      _wf_profile_bearer == other._wf_profile_bearer &&
      _wf_public_id == other._wf_public_id;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Integrations {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("wf_profile_bearer=" + "$_wf_profile_bearer" + ", ");
    buffer.write("wf_public_id=" + "$_wf_public_id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Integrations copyWith({String? id, String? wf_profile_bearer, String? wf_public_id}) {
    return Integrations._internal(
      id: id ?? this.id,
      wf_profile_bearer: wf_profile_bearer ?? this.wf_profile_bearer,
      wf_public_id: wf_public_id ?? this.wf_public_id);
  }
  
  Integrations.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _wf_profile_bearer = json['wf_profile_bearer'],
      _wf_public_id = json['wf_public_id'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'wf_profile_bearer': _wf_profile_bearer, 'wf_public_id': _wf_public_id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'wf_profile_bearer': _wf_profile_bearer, 'wf_public_id': _wf_public_id, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField WF_PROFILE_BEARER = QueryField(fieldName: "wf_profile_bearer");
  static final QueryField WF_PUBLIC_ID = QueryField(fieldName: "wf_public_id");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Integrations";
    modelSchemaDefinition.pluralName = "Integrations";
    
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
      key: Integrations.WF_PROFILE_BEARER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Integrations.WF_PUBLIC_ID,
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

class _IntegrationsModelType extends ModelType<Integrations> {
  const _IntegrationsModelType();
  
  @override
  Integrations fromJson(Map<String, dynamic> jsonData) {
    return Integrations.fromJson(jsonData);
  }
}