import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/modules/core/core_module.dart';
import 'package:kanban/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: CoreModule());
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
