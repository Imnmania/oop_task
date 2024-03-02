import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_task/core/network/impl/network_info_impl.dart';
import 'package:oop_task/features/tasks/data/data_sources/impl/task_local_data_source_impl.dart';
import 'package:oop_task/features/tasks/data/data_sources/impl/task_remote_data_source_impl.dart';
import 'package:oop_task/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:oop_task/features/tasks/domain/use_cases/get_task_list_from_api_response.dart';
import 'package:oop_task/features/tasks/presentation/states/get_task_cubit.dart';
import 'package:oop_task/features/tasks/presentation/widgets/list_widget.dart';
import 'package:oop_task/features/tasks/presentation/widgets/reload_button.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late GetTaskCubit _getTaskCubit;

  @override
  void initState() {
    super.initState();
    _testMyModels();
  }

  @override
  void dispose() {
    _getTaskCubit.close();
    super.dispose();
  }

  void _testMyModels() async {
    /// Haven't implemented any dependency injection yet.
    _getTaskCubit = GetTaskCubit(
        useCase: GetTaskListFromApiResponse(
            repository: TaskRepositoryImpl(
                localDataSource: TaskLocalDataSourceImpl(),
                remoteDataSource: TaskRemoteDataSourceImpl(),
                networkInfo: NetworkInfoImpl(
                    dataConnectionChecker: DataConnectionChecker()))))
      ..getTasksFromUseCase();
  }

  void _taskCubitListener(context, state) {
    if (state is GetTaskSuccessState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully Loaded')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OOP Task'),
        centerTitle: true,
      ),
      body: BlocConsumer<GetTaskCubit, GetTaskState>(
        bloc: _getTaskCubit,
        listener: _taskCubitListener,
        builder: (context, state) {
          if (state is GetTaskLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetTaskSuccessState) {
            return Column(
              children: [
                Expanded(child: ListWidget(state: state)),
                ReloadButton(onTap: _getTaskCubit.getTasksFromUseCase),
              ],
            );
          }
          return const Center(
            child: Text('No data found'),
          );
        },
      ),
    );
  }
}
