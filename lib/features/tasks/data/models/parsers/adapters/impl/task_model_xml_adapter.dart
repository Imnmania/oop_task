import 'dart:developer' show log;

import 'package:oop_task/core/constants/constants.dart';
import 'package:oop_task/features/tasks/data/models/graphics_design_model.dart';
import 'package:oop_task/features/tasks/data/models/mathematics_model.dart';
import 'package:oop_task/features/tasks/data/models/parsers/adapters/task_model_parser_adapter.dart';
import 'package:oop_task/features/tasks/data/models/programming_model.dart';
import 'package:oop_task/features/tasks/data/models/task_model.dart';
import 'package:xml/xml.dart';

class TaskModelXmlAdapter implements TaskModelParserAdapter {
  const TaskModelXmlAdapter._internal();
  static const TaskModelXmlAdapter instance = TaskModelXmlAdapter._internal();

  @override
  List<TaskModel> getTaskList(data) {
    try {
      final dataToParse = data as String;
      final rawXml = XmlDocument.parse(dataToParse);
      final xmlElements = rawXml.findAllElements('task');
      return xmlElements.map((xml) {
        if (xml.findElements(Constants.programmingKey).isNotEmpty) {
          return ProgrammingModel.fromXml(xml);
        }
        if (xml.findElements(Constants.mathematicsKey).isNotEmpty) {
          return MathematicsModel.fromXml(xml);
        }
        if (xml.findElements(Constants.graphicsDesignKey).isNotEmpty) {
          return GraphicsDesignModel.fromXml(xml);
        }
        return TaskModel.fromXml(xml);
      }).toList();
    } catch (ex, st) {
      log(ex.toString(), time: DateTime.now(), stackTrace: st, level: 100);
      throw Exception('[ TaskModelXmlAdapter ] => Parsing error');
    }
  }
}
