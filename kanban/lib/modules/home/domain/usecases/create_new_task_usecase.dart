import 'package:dartz/dartz.dart';
import 'package:kanban/modules/core/failures/failure.dart';
import 'package:kanban/modules/home/domain/repositories/home_repository.dart';

sealed class CreateNewTaskUsecase {
  Future<Either<Failure, bool>> call(String task);
}

class CreateNewTaskUsecaseImp implements CreateNewTaskUsecase {
  final HomeRepository _repository;

  CreateNewTaskUsecaseImp({required HomeRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(task) async {
    return await _repository.createNewTask(task);
  }
}
