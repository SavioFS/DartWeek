import 'dart:convert';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

part 'user_controller.g.dart';

class UserController {


@Route.get('/')
Future<Response> helloWorld(Request request) async{
  return Response.ok(jsonEncode({'name': 'Hello World'}));
}

  Router get router => _$UserControllerRouter(this);
}
