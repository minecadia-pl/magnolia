import 'dart:convert';

import 'package:magnolia/src/config.dart';
import 'package:magnolia/src/models/response/response_models.dart';
import 'package:shelf/shelf.dart';

Middleware authMiddleware() {
  return (handler) {
    return (request) async {
      final method = request.method;
      if (method == 'POST' && !_isAuthorized(request)) {
        final errorResponse = ErrorResponseModel.create(
            request,
            'Authorization token is missing or invalid.'
        );
        return Response.unauthorized(
            jsonEncode(errorResponse.toJson()),
            headers: {'Content-Type': 'application/json'}
        );
      }
      return await handler.call(request);
    };
  };
}

bool _isAuthorized(Request request) {
  final apiKey = request.headers['Authorization'];
  return apiKey != null && apiKey == magnoliaApiAuthorizationToken;
}
