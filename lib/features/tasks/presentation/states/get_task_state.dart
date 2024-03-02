part of 'get_task_cubit.dart';

@immutable
abstract class GetTaskState extends Equatable {}

class GetTaskInitial extends GetTaskState {
  @override
  List<Object?> get props => [];
}

class GetTaskLoadingState extends GetTaskState {
  @override
  List<Object?> get props => [];
}

class GetTaskSuccessState extends GetTaskState {
  final List<TaskEntity> taskList;

  GetTaskSuccessState(this.taskList);

  @override
  List<Object?> get props => [
        taskList,
      ];
}

class GetTaskFailState extends GetTaskState {
  final String errorMessage;

  GetTaskFailState(this.errorMessage);

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
