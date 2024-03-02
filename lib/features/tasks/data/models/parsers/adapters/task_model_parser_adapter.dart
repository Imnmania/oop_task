import 'package:flutter/cupertino.dart';
import 'package:oop_task/features/tasks/data/models/task_model.dart';

@immutable
abstract class TaskModelParserAdapter {
  List<TaskModel> getTaskList(dynamic data);
}
