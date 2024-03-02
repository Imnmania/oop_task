import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:oop_task/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failures, Type>?> call({
    required Params params,
  });
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
