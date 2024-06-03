import 'package:dartz/dartz.dart';
import 'package:kanban/modules/core/failures/failure.dart';
import 'package:kanban/modules/home/data/models/task_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<TaskModel>>> getTasks();
}
