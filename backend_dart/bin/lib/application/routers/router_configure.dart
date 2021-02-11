import 'package:shelf_router/src/router.dart';

import '../modules/user/users_routers.dart';
import 'i_router_configure.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouterConfigure> routers = [UsersRouters()];

  RouterConfigure(this._router);

  void configure() => routers.forEach((r) => r.configure(_router));
}
