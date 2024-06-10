import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';
import 'package:kanban/modules/home/data/datasource/home_datasource.dart';
import 'package:kanban/modules/home/data/models/task_model.dart';

class HomeDatasourceImp implements HomeDatasource {
  //MOCK
  List<TaskModel> tasks = [
    TaskModel(id: 1, name: "tarefa1", taskStatus: TaskStatusEnum.notStarted, idProject: 1),
    TaskModel(id: 2, name: "tarefa2", taskStatus: TaskStatusEnum.doing, idProject: 1),
    TaskModel(id: 3, name: "tarefa3", taskStatus: TaskStatusEnum.started, idProject: 1),
    TaskModel(id: 4, name: "tarefa4", taskStatus: TaskStatusEnum.finished, idProject: 1),
    TaskModel(id: 5, name: "tarefa5", taskStatus: TaskStatusEnum.started, idProject: 1),
    TaskModel(id: 6, name: "tarefa6", taskStatus: TaskStatusEnum.doing, idProject: 1),
  ];

  @override
  Future<List<Map<String, List<TaskModel>>>> getTasks() async {
    List<TaskModel> notStartedList = [];
    List<TaskModel> startedList = [];
    List<TaskModel> doingList = [];
    List<TaskModel> finishedList = [];

    List<Map<String, List<TaskModel>>> finalList = [];

    for (var task in tasks) {
      switch (task.taskStatus) {
        case TaskStatusEnum.notStarted:
          notStartedList.add(task);
          break;
        case TaskStatusEnum.started:
          startedList.add(task);
          break;
        case TaskStatusEnum.doing:
          doingList.add(task);
          break;
        case TaskStatusEnum.finished:
          finishedList.add(task);
          break;
      }
    }

    finalList.add({"notStarted": notStartedList});
    finalList.add({"started": startedList});
    finalList.add({"doing": doingList});
    finalList.add({"finished": finishedList});

    return finalList;
  }

  @override
  Future<bool> createNewTask(String task) async {
    try {
      tasks.add(TaskModel(id: tasks.length + 1, name: task, taskStatus: TaskStatusEnum.notStarted, idProject: 1));
      return true;
    } catch (error) {
      return false;
    }
  }
}
