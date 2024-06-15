import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/modules/core/domain/entities/task_entity.dart';
import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/app_snackbar_widget.dart';
import 'package:kanban/modules/home/domain/usecases/create_new_task_usecase.dart';
import 'package:kanban/modules/home/domain/usecases/get_tasks_usecase.dart';

class HomeController extends ChangeNotifier {
  final GetTasksUsecase _getTasksUsecase;
  final CreateNewTaskUsecase _createNewTaskUsecase;

  HomeController({
    required GetTasksUsecase getTasksUsecase,
    required CreateNewTaskUsecase createNewTaskUsecase,
  })  : _getTasksUsecase = getTasksUsecase,
        _createNewTaskUsecase = createNewTaskUsecase;

  ValueNotifier<List<TaskEntity>> notStartedList = ValueNotifier([]);
  ValueNotifier<List<TaskEntity>> startedList = ValueNotifier([]);
  ValueNotifier<List<TaskEntity>> doingList = ValueNotifier([]);
  ValueNotifier<List<TaskEntity>> finishedList = ValueNotifier([]);

  final TextEditingController titleController = TextEditingController();

  final createTaskKey = GlobalKey<FormState>();

  TaskStatusEnum status = TaskStatusEnum.started;

  bool validateForm() {
    return createTaskKey.currentState?.validate() == true;
  }

  void getTasks(context) async {
    final response = await _getTasksUsecase.call();
    notStartedList.value = [];
    startedList.value = [];
    doingList.value = [];
    finishedList.value = [];

    response.fold((l) {
      AppSnackbarWidget.snackBar(context: context, message: l.message);
    }, (r) {
      notStartedList.value = r[0]["notStarted"] ?? [];
      startedList.value = r[1]["started"] ?? [];
      doingList.value = r[2]["doing"] ?? [];
      finishedList.value = r[3]["finished"] ?? [];

      notifyListeners();
    });
  }

  void createNewTask(context) async {
    var response = await _createNewTaskUsecase.call(titleController.text);
    response.fold((l) {
      debugPrint("deu erro em algo: $l");
    }, (r) {
      getTasks(context);
      Modular.to.pop();
    });
  }

  void updateTask() {
    debugPrint(" atualizando tarefa: $status");
  }
}
