import 'package:oop_task/features/tasks/data/models/task_model.dart';

abstract class TaskLocalDataSource {
  List<TaskModel> getLocalData();
}
