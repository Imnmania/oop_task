import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_task/core/error/failures.dart';
import 'package:oop_task/core/use_case/use_case.dart';
import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';
import 'package:oop_task/features/tasks/domain/use_cases/get_task_list_from_api_response.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  final GetTaskListFromApiResponse _useCase;

  GetTaskCubit({required GetTaskListFromApiResponse useCase})
      : _useCase = useCase,
        super(GetTaskInitial());

  Future<void> getTasksFromUseCase() async {
    emit(GetTaskLoadingState());
    await Future.delayed(const Duration(milliseconds: 600));
    final result = await _useCase.call(params: const NoParams());
    result?.fold(
      (failure) => emit(GetTaskFailState(_getFailMessage(failure))),
      (taskList) => emit(GetTaskSuccessState(taskList)),
    );
  }

  String _getFailMessage(Failures failures) {
    switch (failures.runtimeType) {
      case const (ServerFailure):
        return 'Server failure';
      case const (CacheFailure):
        return 'Cache failure';
      default:
        return 'Unknown failure';
    }
  }
}
