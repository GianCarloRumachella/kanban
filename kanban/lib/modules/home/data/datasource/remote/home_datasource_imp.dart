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
  Future<List<TaskModel>> getTasks() async {
    return tasks;
  }
}
