import 'dart:io';

import 'package:shelf/shelf.dart';

const _defaultCorsHeader = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Header':
      '${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}'
};

Middleware cors({Map<String, String> headers = _defaultCorsHeader}) {
  return (Handler innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response(HttpStatus.ok, headers: headers);
      }

      final mapHeader = {
        ...request?.headers,
        ...headers,
      };

      final response = await innerHandler(request.change(headers: mapHeader));
      return response.change(headers: headers);
    };
  };
}
