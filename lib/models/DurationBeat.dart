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
  final int? _hours;
  final int? _minutes;
  final int? _seconds;

  int? get hours {
    return _hours;
  }
  
  int? get minutes {
    return _minutes;
  }
  
  int? get seconds {
    return _seconds;
  }
  
  const DurationBeat._internal({hours, minutes, seconds}): _hours = hours, _minutes = minutes, _seconds = seconds;
  
  factory DurationBeat({int? hours, int? minutes, int? seconds}) {
    return DurationBeat._internal(
      hours: hours,
      minutes: minutes,
      seconds: seconds);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DurationBeat &&
      _hours == other._hours &&
      _minutes == other._minutes &&
      _seconds == other._seconds;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DurationBeat {");
    buffer.write("hours=" + (_hours != null ? _hours!.toString() : "null") + ", ");
    buffer.write("minutes=" + (_minutes != null ? _minutes!.toString() : "null") + ", ");
    buffer.write("seconds=" + (_seconds != null ? _seconds!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DurationBeat copyWith({int? hours, int? minutes, int? seconds}) {
    return DurationBeat._internal(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds);
  }
  
  DurationBeat.fromJson(Map<String, dynamic> json)  
    : _hours = (json['hours'] as num?)?.toInt(),
      _minutes = (json['minutes'] as num?)?.toInt(),
      _seconds = (json['seconds'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'hours': _hours, 'minutes': _minutes, 'seconds': _seconds
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DurationBeat";
    modelSchemaDefinition.pluralName = "DurationBeats";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'hours',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'minutes',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'seconds',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}