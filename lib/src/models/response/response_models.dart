import 'package:json_annotation/json_annotation.dart';

part 'response_models.g.dart';

sealed class GenericResponseModel {
  final String path;
  final String method;
  final String? message;
  final Map<String, dynamic>? data;

  GenericResponseModel({required this.path, required this.method, this.message, this.data});
}

@JsonSerializable(createFactory: false)
final class ErrorResponseModel extends GenericResponseModel {
  ErrorResponseModel({required super.path, required super.method, required super.message, super.data});

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}

@JsonSerializable(createFactory: false)
final class SuccessResponseModel extends GenericResponseModel {
  SuccessResponseModel({required super.path, required super.method, super.message, super.data});

  Map<String, dynamic> toJson() => _$SuccessResponseModelToJson(this);
}
