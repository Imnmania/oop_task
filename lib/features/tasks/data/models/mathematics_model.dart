import 'package:oop_task/features/tasks/data/models/task_model.dart';
import 'package:xml/xml.dart';

class MathematicsModel extends TaskModel {
  final String field;

  const MathematicsModel({
    required super.title,
    required super.description,
    required super.type,
    required this.field,
  });

  factory MathematicsModel.fromJson(Map<String, dynamic> json) =>
      MathematicsModel(
        title: json['title'],
        description: json['description'],
        type: json['type'],
        field: json['field'],
      );

  factory MathematicsModel.fromXml(XmlElement xml) => MathematicsModel(
        title: xml.findElements('title').first.innerText,
        description: xml.findElements('description').first.innerText,
        type: xml.findElements('type').first.innerText,
        field: xml.findElements('field').first.innerText,
      );

  @override
  String toString() {
    return 'TaskModel ( title: $title, description: $description, type: $type, field: $field )';
  }
}
