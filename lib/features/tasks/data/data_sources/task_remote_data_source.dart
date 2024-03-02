import 'package:oop_task/features/tasks/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  List<TaskModel> getRemoteData();
}
