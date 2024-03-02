import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_task/core/network/impl/network_info_impl.dart';
import 'package:oop_task/features/tasks/data/data_sources/impl/task_local_data_source_impl.dart';
import 'package:oop_task/features/tasks/data/data_sources/impl/task_remote_data_source_impl.dart';
import 'package:oop_task/features/tasks/data/models/graphics_design_model.dart';
import 'package:oop_task/features/tasks/data/models/mathematics_model.dart';
import 'package:oop_task/features/tasks/data/models/programming_model.dart';
import 'package:oop_task/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:oop_task/features/tasks/domain/use_cases/get_task_list_from_api_response.dart';
import 'package:oop_task/features/tasks/presentation/states/get_task_cubit.dart';

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

  void _testMyModels() async {
    _getTaskCubit = GetTaskCubit(
        useCase: GetTaskListFromApiResponse(
            repository: TaskRepositoryImpl(
                localDataSource: TaskLocalDataSourceImpl(),
                remoteDataSource: TaskRemoteDataSourceImpl(),
                networkInfo: NetworkInfoImpl(
                    dataConnectionChecker: DataConnectionChecker()))))
      ..getTasksFromUseCase();
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
        buildWhen: (previous, current) => true,
        listener: (context, state) {
          if (state is GetTaskSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Successfully Loaded')));
          }
        },
        builder: (context, state) {
          if (state is GetTaskLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetTaskSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.taskList.length,
                    itemBuilder: (context, index) {
                      final task = state.taskList[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(task.title),
                              Text(task.description),
                              Text(task.type),
                              if (task is GraphicsDesignModel)
                                Text(task.output),
                              if (task is ProgrammingModel) Text(task.platform),
                              if (task is ProgrammingModel) Text(task.language),
                              if (task is MathematicsModel) Text(task.field),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _getTaskCubit.getTasksFromUseCase();
                    },
                    child: const Text('Reload'),
                  ),
                ),
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
