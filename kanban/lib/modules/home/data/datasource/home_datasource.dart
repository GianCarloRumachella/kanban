import 'package:kanban/modules/home/data/models/task_model.dart';

abstract class HomeDatasource {
  Future<List<TaskModel>> getTasks();
}
