import 'package:oop_task/features/tasks/data/data_sources/task_remote_data_source.dart';
import 'package:oop_task/features/tasks/data/models/parsers/task_model_parser.dart';
import 'package:oop_task/features/tasks/data/models/task_model.dart';

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  @override
  List<TaskModel> getRemoteData() {
    const rawData = _remoteData;
    return TaskModelParser.parseList(input: rawData);
  }
}

const _remoteData = """
<?xml version="1.0" encoding="UTF-8" ?>
<data>
  <task>
    <title>Sample Programming task</title>
    <description>Create E-Commerce client</description>
    <type>Programming</type>
    <platform>WEB</platform>
    <language>JavaScript</language>
  </task>
  <task>
    <title>Sample Math task</title>
    <description>Solve the calculus</description>
    <type>Mathematics</type>
    <field>Calculus</field>
  </task>
  <task>
    <title>Sample Graphic Design task</title>
    <description>UX design for E-Commerce</description>
    <type>Graphics_Design</type>
    <output>Figma</output>
  </task>
</data>
""";
