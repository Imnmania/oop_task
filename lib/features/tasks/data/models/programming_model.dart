import 'package:oop_task/features/tasks/data/models/task_model.dart';
import 'package:xml/xml.dart';

class ProgrammingModel extends TaskModel {
  final String platform;
  final String language;

  const ProgrammingModel({
    required super.title,
    required super.description,
    required super.type,
    required this.platform,
    required this.language,
  });

  factory ProgrammingModel.fromJson(Map<String, dynamic> json) =>
      ProgrammingModel(
        title: json['title'],
        description: json['description'],
        type: json['type'],
        platform: json['platform'],
        language: json['language'],
      );

  factory ProgrammingModel.fromXml(XmlElement xml) => ProgrammingModel(
        title: xml.findElements('title').first.innerText,
        description: xml.findElements('description').first.innerText,
        type: xml.findElements('type').first.innerText,
        platform: xml.findElements('platform').first.innerText,
        language: xml.findElements('language').first.innerText,
      );

  @override
  String toString() {
    return 'TaskModel ( title: $title, description: $description, type: $type. platform: $platform , language: $language )';
  }
}
