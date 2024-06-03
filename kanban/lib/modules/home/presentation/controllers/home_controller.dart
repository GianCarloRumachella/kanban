import 'package:flutter/material.dart';
import 'package:kanban/modules/core/domain/entities/task_entity.dart';
import 'package:kanban/modules/home/domain/usecases/get_tasks_usecase.dart';

class HomeController extends ChangeNotifier {
  final GetTasksUsecase _getTasksUsecase;

  HomeController({required GetTasksUsecase getTasksUsecase}) : _getTasksUsecase = getTasksUsecase;

  ValueNotifier<List<TaskEntity>> taskList = ValueNotifier([]);

  void getTasks() async {
    final response = await _getTasksUsecase.call();

    response.fold((l) {
      debugPrint("deu erro em algo: $l");
    }, (r) {
      taskList.value = r;
      notifyListeners();
    });
  }
}
