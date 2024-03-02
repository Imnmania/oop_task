import 'package:oop_task/features/tasks/data/models/task_model.dart';
import 'package:xml/xml.dart';

class GraphicsDesignModel extends TaskModel {
  final String output;

  const GraphicsDesignModel({
    required super.title,
    required super.description,
    required super.type,
    required this.output,
  });

  factory GraphicsDesignModel.fromJson(Map<String, dynamic> json) =>
      GraphicsDesignModel(
        title: json['title'],
        description: json['description'],
        type: json['type'],
        output: json['output'],
      );

  factory GraphicsDesignModel.fromXml(XmlElement xml) => GraphicsDesignModel(
        title: xml.findElements('title').first.innerText,
        description: xml.findElements('description').first.innerText,
        type: xml.findElements('type').first.innerText,
        output: xml.findElements('output').first.innerText,
      );

  @override
  String toString() {
    return 'TaskModel ( title: $title, description: $description, type: $type, output: $output )';
  }
}
