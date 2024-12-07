import 'package:json_annotation/json_annotation.dart';

part 'request_models.g.dart';

@JsonSerializable(createToJson: false)
final class AccountLinkRequestModel {
  final String uniqueId;

  AccountLinkRequestModel({required this.uniqueId});

  factory AccountLinkRequestModel.fromJson(Map<String, dynamic> json) => _$AccountLinkRequestModelFromJson(json);
}
