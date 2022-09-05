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

/** This is an auto generated class representing the DurationBeat type in your schema. */
@immutable
class DurationBeat {
  final int? _durationSeconds;
  final int? _durationMinutes;
  final int? _durationHours;

  int? get durationSeconds {
    return _durationSeconds;
  }

  int? get durationMinutes {
    return _durationMinutes;
  }

  int? get durationHours {
    return _durationHours;
  }

  const DurationBeat._internal(
      {durationSeconds, durationMinutes, durationHours})
      : _durationSeconds = durationSeconds,
        _durationMinutes = durationMinutes,
        _durationHours = durationHours;

  factory DurationBeat(
      {int? durationSeconds, int? durationMinutes, int? durationHours}) {
    return DurationBeat._internal(
        durationSeconds: durationSeconds,
        durationMinutes: durationMinutes,
        durationHours: durationHours);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DurationBeat &&
        _durationSeconds == other._durationSeconds &&
        _durationMinutes == other._durationMinutes &&
        _durationHours == other._durationHours;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("DurationBeat {");
    buffer.write("durationSeconds=" +
        (_durationSeconds != null ? _durationSeconds!.toString() : "null") +
        ", ");
    buffer.write("durationMinutes=" +
        (_durationMinutes != null ? _durationMinutes!.toString() : "null") +
        ", ");
    buffer.write("durationHours=" +
        (_durationHours != null ? _durationHours!.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  DurationBeat copyWith(
      {int? durationSeconds, int? durationMinutes, int? durationHours}) {
    return DurationBeat._internal(
        durationSeconds: durationSeconds ?? this.durationSeconds,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        durationHours: durationHours ?? this.durationHours);
  }

  DurationBeat.fromJson(Map<String, dynamic> json)
      : _durationSeconds = (json['durationSeconds'] as num?)?.toInt(),
        _durationMinutes = (json['durationMinutes'] as num?)?.toInt(),
        _durationHours = (json['durationHours'] as num?)?.toInt();

  Map<String, dynamic> toJson() => {
        'durationSeconds': _durationSeconds,
        'durationMinutes': _durationMinutes,
        'durationHours': _durationHours
      };

  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DurationBeat";
    modelSchemaDefinition.pluralName = "DurationBeats";

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'durationSeconds',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'durationMinutes',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'durationHours',
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));
  });
}
