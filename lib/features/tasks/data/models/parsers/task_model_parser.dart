import 'dart:developer';

import 'package:oop_task/core/data_types/input_type.dart';
import 'package:oop_task/features/tasks/data/models/parsers/adapters/impl/task_model_json_adapter.dart';
import 'package:oop_task/features/tasks/data/models/parsers/adapters/impl/task_model_xml_adapter.dart';
import 'package:oop_task/features/tasks/data/models/task_model.dart';

class TaskModelParser {
  TaskModelParser._internal();

  static List<TaskModel> parseList({
    required dynamic input,
  }) {
    switch (InputType.fromInput(input)) {
      case InputType.json:
        log('PARSING JSON DATA');
        return TaskModelJsonAdapter.instance.getTaskList(input);
      case InputType.xml:
        log('PARSING XML DATA');
        return TaskModelXmlAdapter.instance.getTaskList(input);
      default:
        throw Exception('Parser not found!');
    }
  }
}
