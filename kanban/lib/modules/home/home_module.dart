import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/app_routes.dart';
import 'package:kanban/modules/home/data/datasource/home_datasource.dart';
import 'package:kanban/modules/home/data/datasource/remote/home_datasource_imp.dart';
import 'package:kanban/modules/home/data/repositories/home_repository_imp.dart';
import 'package:kanban/modules/home/domain/repositories/home_repository.dart';
import 'package:kanban/modules/home/domain/usecases/get_tasks_usecase.dart';
import 'package:kanban/modules/home/presentation/controllers/home_controller.dart';
import 'package:kanban/modules/home/presentation/page/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<HomeDatasource>(() => HomeDatasourceImp());
    i.addLazySingleton<HomeRepository>(() => HomeRepositoryImp(datasource: i.get<HomeDatasource>()));
    i.addLazySingleton<GetTasksUsecase>(() => GetTasksUsecaseImp(repository: i.get<HomeRepository>()));
    i.addLazySingleton<HomeController>(() => HomeController(getTasksUsecase: i.get<GetTasksUsecase>()));
  }

  @override
  void routes(r) {
    r.child(AppRoutes.initialRoute, child: (context) => const HomePage());
  }
}
