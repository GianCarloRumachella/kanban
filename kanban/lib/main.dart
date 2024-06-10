import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/app_module.dart';
import 'package:kanban/app_widget.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
  // ).then(
  //   (_) => runApp(
  //     ModularApp(
  //       module: AppModule(),
  //       child: const AppWidget(),
  //     ),
  //   ),
  // );
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
