import 'package:dartz/dartz.dart';
import 'package:oop_task/core/error/failures.dart';
import 'package:oop_task/core/use_case/use_case.dart';
import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';
import 'package:oop_task/features/tasks/domain/repositories/task_repository.dart';

class GetTaskListFromApiResponse extends UseCase<List<TaskEntity>, NoParams> {
  final TaskRepository _repository;

  GetTaskListFromApiResponse({
    required TaskRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failures, List<TaskEntity>>?> call({
    required NoParams params,
  }) async {
    return _repository.getTasks();
  }
}
