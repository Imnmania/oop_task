import 'package:dartz/dartz.dart';
import 'package:oop_task/core/error/failures.dart';
import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failures, List<TaskEntity>>> getTasks();
}
