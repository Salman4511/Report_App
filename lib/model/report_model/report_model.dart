import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'reportID')
  int? reportId;
  String? title;
  String? content;
  DateTime? createdAt;

  ReportModel({
    this.id,
    this.reportId,
    this.title,
    this.content,
    this.createdAt,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return _$ReportModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);
}
