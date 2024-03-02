import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';
import 'package:xml/xml.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.title,
    required super.description,
    required super.type,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json['title'],
        description: json['description'],
        type: json['type'],
      );

  factory TaskModel.fromXml(XmlElement xml) {
    return TaskModel(
      title: xml.findElements('title').first.innerText,
      description: xml.findElements('description').first.innerText,
      type: xml.findElements('type').first.innerText,
    );
  }

  @override
  String toString() {
    return 'TaskModel ( title: $title, description: $description, type: $type )';
  }
}
