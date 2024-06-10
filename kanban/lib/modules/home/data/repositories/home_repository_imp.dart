import 'package:dartz/dartz.dart';
import 'package:kanban/modules/core/failures/failure.dart';
import 'package:kanban/modules/home/data/datasource/home_datasource.dart';
import 'package:kanban/modules/home/data/models/task_model.dart';
import 'package:kanban/modules/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDatasource _datasource;

  HomeRepositoryImp({required HomeDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, List<Map<String, List<TaskModel>>>>> getTasks() async {
    try {
      var response = await _datasource.getTasks();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> createNewTask(String task) async {
    try {
      var response = await _datasource.createNewTask(task);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
