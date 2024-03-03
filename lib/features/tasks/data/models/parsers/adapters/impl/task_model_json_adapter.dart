import 'dart:convert' show jsonDecode;
import 'dart:developer' show log;

import 'package:oop_task/core/constants/constants.dart';
import 'package:oop_task/features/tasks/data/models/graphics_design_model.dart';
import 'package:oop_task/features/tasks/data/models/mathematics_model.dart';
import 'package:oop_task/features/tasks/data/models/parsers/adapters/task_model_parser_adapter.dart';
import 'package:oop_task/features/tasks/data/models/programming_model.dart';
import 'package:oop_task/features/tasks/data/models/task_model.dart';

class TaskModelJsonAdapter implements TaskModelParserAdapter {
  const TaskModelJsonAdapter._internal();
  static const TaskModelJsonAdapter instance = TaskModelJsonAdapter._internal();

  @override
  List<TaskModel> getTaskList(data) {
    try {
      final dataToParse = data as String;
      final rawJson = jsonDecode(dataToParse) as List<dynamic>;
      return rawJson.map(
        (json) {
          if (json.containsKey(Constants.programmingKey)) {
            return ProgrammingModel.fromJson(json);
          }
          if (json.containsKey(Constants.mathematicsKey)) {
            return MathematicsModel.fromJson(json);
          }
          if (json.containsKey(Constants.graphicsDesignKey)) {
            return GraphicsDesignModel.fromJson(json);
          }
          return TaskModel.fromJson(json);
        },
      ).toList();
    } catch (ex, st) {
      log(ex.toString(), time: DateTime.now(), stackTrace: st, level: 100);
      throw Exception('[ TaskModelJsonAdapter ] => Parsing error');
    }
  }
}
