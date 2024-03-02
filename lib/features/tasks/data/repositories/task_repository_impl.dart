import 'package:dartz/dartz.dart';
import 'package:oop_task/core/error/exceptions.dart';
import 'package:oop_task/core/error/failures.dart';
import 'package:oop_task/core/network/network_info.dart';
import 'package:oop_task/features/tasks/data/data_sources/task_local_data_source.dart';
import 'package:oop_task/features/tasks/data/data_sources/task_remote_data_source.dart';
import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';
import 'package:oop_task/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _remoteDataSource;
  final TaskLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  TaskRepositoryImpl({
    required TaskRemoteDataSource remoteDataSource,
    required TaskLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failures, List<TaskEntity>>> getTasks() async {
    if (await _networkInfo.isConnected()) {
      try {
        return Right(_remoteDataSource.getRemoteData());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(_localDataSource.getLocalData());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
