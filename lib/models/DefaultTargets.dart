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


/** This is an auto generated class representing the DefaultTargets type in your schema. */
@immutable
class DefaultTargets extends Model {
  static const classType = const _DefaultTargetsModelType();
  final String id;
  final DurationBeat? _fitness;
  final DurationBeat? _fuel;
  final DurationBeat? _productivity;
  final DurationBeat? _social;
  final DurationBeat? _rest;
  final bool? _firstTime;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  DurationBeat get fitness {
    try {
      return _fitness!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DurationBeat get fuel {
    try {
      return _fuel!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DurationBeat get productivity {
    try {
      return _productivity!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DurationBeat get social {
    try {
      return _social!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  DurationBeat get rest {
    try {
      return _rest!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get firstTime {
    try {
      return _firstTime!;
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
  
  const DefaultTargets._internal({required this.id, required fitness, required fuel, required productivity, required social, required rest, required firstTime, createdAt, updatedAt}): _fitness = fitness, _fuel = fuel, _productivity = productivity, _social = social, _rest = rest, _firstTime = firstTime, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DefaultTargets({String? id, required DurationBeat fitness, required DurationBeat fuel, required DurationBeat productivity, required DurationBeat social, required DurationBeat rest, required bool firstTime}) {
    return DefaultTargets._internal(
      id: id == null ? UUID.getUUID() : id,
      fitness: fitness,
      fuel: fuel,
      productivity: productivity,
      social: social,
      rest: rest,
      firstTime: firstTime);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DefaultTargets &&
      id == other.id &&
      _fitness == other._fitness &&
      _fuel == other._fuel &&
      _productivity == other._productivity &&
      _social == other._social &&
      _rest == other._rest &&
      _firstTime == other._firstTime;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DefaultTargets {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("fitness=" + (_fitness != null ? _fitness!.toString() : "null") + ", ");
    buffer.write("fuel=" + (_fuel != null ? _fuel!.toString() : "null") + ", ");
    buffer.write("productivity=" + (_productivity != null ? _productivity!.toString() : "null") + ", ");
    buffer.write("social=" + (_social != null ? _social!.toString() : "null") + ", ");
    buffer.write("rest=" + (_rest != null ? _rest!.toString() : "null") + ", ");
    buffer.write("firstTime=" + (_firstTime != null ? _firstTime!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DefaultTargets copyWith({String? id, DurationBeat? fitness, DurationBeat? fuel, DurationBeat? productivity, DurationBeat? social, DurationBeat? rest, bool? firstTime}) {
    return DefaultTargets._internal(
      id: id ?? this.id,
      fitness: fitness ?? this.fitness,
      fuel: fuel ?? this.fuel,
      productivity: productivity ?? this.productivity,
      social: social ?? this.social,
      rest: rest ?? this.rest,
      firstTime: firstTime ?? this.firstTime);
  }
  
  DefaultTargets.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _fitness = json['fitness']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['fitness']['serializedData']))
        : null,
      _fuel = json['fuel']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['fuel']['serializedData']))
        : null,
      _productivity = json['productivity']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['productivity']['serializedData']))
        : null,
      _social = json['social']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['social']['serializedData']))
        : null,
      _rest = json['rest']?['serializedData'] != null
        ? DurationBeat.fromJson(new Map<String, dynamic>.from(json['rest']['serializedData']))
        : null,
      _firstTime = json['firstTime'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'fitness': _fitness?.toJson(), 'fuel': _fuel?.toJson(), 'productivity': _productivity?.toJson(), 'social': _social?.toJson(), 'rest': _rest?.toJson(), 'firstTime': _firstTime, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'fitness': _fitness, 'fuel': _fuel, 'productivity': _productivity, 'social': _social, 'rest': _rest, 'firstTime': _firstTime, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField FITNESS = QueryField(fieldName: "fitness");
  static final QueryField FUEL = QueryField(fieldName: "fuel");
  static final QueryField PRODUCTIVITY = QueryField(fieldName: "productivity");
  static final QueryField SOCIAL = QueryField(fieldName: "social");
  static final QueryField REST = QueryField(fieldName: "rest");
  static final QueryField FIRSTTIME = QueryField(fieldName: "firstTime");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DefaultTargets";
    modelSchemaDefinition.pluralName = "DefaultTargets";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'fitness',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DurationBeat')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'fuel',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DurationBeat')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'productivity',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DurationBeat')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'social',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DurationBeat')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'rest',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embedded, ofCustomTypeName: 'DurationBeat')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DefaultTargets.FIRSTTIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
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

class _DefaultTargetsModelType extends ModelType<DefaultTargets> {
  const _DefaultTargetsModelType();
  
  @override
  DefaultTargets fromJson(Map<String, dynamic> jsonData) {
    return DefaultTargets.fromJson(jsonData);
  }
}