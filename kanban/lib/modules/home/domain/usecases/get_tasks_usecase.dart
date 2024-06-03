// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:kanban/modules/core/failures/failure.dart';
import 'package:kanban/modules/home/data/models/task_model.dart';
import 'package:kanban/modules/home/domain/repositories/home_repository.dart';

sealed class GetTasksUsecase {
  Future<Either<Failure, List<TaskModel>>> call();
}

class GetTasksUsecaseImp implements GetTasksUsecase {
  final HomeRepository _repository;

  GetTasksUsecaseImp({required HomeRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, List<TaskModel>>> call() async {
    return await _repository.getTasks();
  }
}
