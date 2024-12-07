import 'package:json_annotation/json_annotation.dart';
import 'package:shelf/shelf.dart';

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

  factory ErrorResponseModel.create(Request request, String message) => ErrorResponseModel(
      path: request.requestedUri.path,
      method: request.method,
      message: message
  );

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}

@JsonSerializable(createFactory: false)
final class SuccessResponseModel extends GenericResponseModel {
  SuccessResponseModel({required super.path, required super.method, super.message, super.data});

  factory SuccessResponseModel.create(Request request, {String? message, Map<String, dynamic>? data}) =>
      SuccessResponseModel(
          path: request.requestedUri.path,
          method: request.method,
          message: message,
          data: data
      );

  Map<String, dynamic> toJson() => _$SuccessResponseModelToJson(this);
}
