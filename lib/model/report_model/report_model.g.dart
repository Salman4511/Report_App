// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      id: json['_id'] as String?,
      reportId: (json['reportID'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'reportID': instance.reportId,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
