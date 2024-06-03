import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';

class TaskEntity {
  int id;
  String name;
  TaskStatusEnum taskStatus;
  int idProject;

  TaskEntity({
    required this.id,
    required this.name,
    required this.taskStatus,
    required this.idProject,
  });
}
