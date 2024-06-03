import 'package:flutter/material.dart';

enum TaskStatusEnum {
  notStarted("notStarted"),
  started("started"),
  doing("doing"),
  finished("finished");

  const TaskStatusEnum(this.name);
  final String name;
  String get statusName => name;

  static TaskStatusEnum getStatusEnum(String name) {
    switch (name) {
      case "notStarted":
        return TaskStatusEnum.notStarted;
      case "started":
        return TaskStatusEnum.started;
      case "doing":
        return TaskStatusEnum.doing;
      case "finished":
        return TaskStatusEnum.finished;
      default:
        return TaskStatusEnum.notStarted;
    }
  }

  static Color getStatusColor(TaskStatusEnum status) {
    switch (status) {
      case TaskStatusEnum.notStarted:
        return Colors.red;
      case TaskStatusEnum.started:
        return Colors.yellow;
      case TaskStatusEnum.doing:
        return Colors.blue;
      case TaskStatusEnum.finished:
        return Colors.green;
    }
  }
}
