import 'package:kanban/modules/home/data/models/task_model.dart';

abstract class HomeDatasource {
  Future<List<Map<String, List<TaskModel>>>> getTasks();
  Future<bool> createNewTask(String task);
}
