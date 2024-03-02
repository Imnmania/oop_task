import 'dart:convert' show jsonDecode;
import 'dart:developer' show log;

import 'package:flutter/cupertino.dart';
import 'package:oop_task/features/tasks/data/models/graphics_design_model.dart';
import 'package:oop_task/features/tasks/data/models/mathematics_model.dart';
import 'package:oop_task/features/tasks/data/models/parsers/adapters/task_model_parser_adapter.dart';
import 'package:oop_task/features/tasks/data/models/programming_model.dart';
import 'package:oop_task/features/tasks/data/models/task_model.dart';

@immutable
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
          final isProgrammingModel = json.containsKey('platform');
          final isMathematicalModel = json.containsKey('field');
          final isGraphicsDesignModel = json.containsKey('output');
          if (isProgrammingModel) {
            return ProgrammingModel.fromJson(json);
          }
          if (isMathematicalModel) {
            return MathematicsModel.fromJson(json);
          }
          if (isGraphicsDesignModel) {
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
