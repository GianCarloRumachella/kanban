import 'dart:convert';

import 'package:kanban/modules/core/domain/entities/task_entity.dart';
import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.name,
    required super.taskStatus,
    required super.idProject,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'taskStatus': taskStatus.statusName,
      'idProject': idProject,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int,
      name: map['name'] as String,
      taskStatus: TaskStatusEnum.getStatusEnum(map['taskStatus']),
      idProject: map['idProject'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, name: $name, taskStatus: $taskStatus, idProject: $idProject)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.taskStatus == taskStatus && other.idProject == idProject;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ taskStatus.hashCode ^ idProject.hashCode;
  }
}
