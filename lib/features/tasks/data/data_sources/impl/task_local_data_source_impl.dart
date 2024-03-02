import 'package:oop_task/features/tasks/data/data_sources/task_local_data_source.dart';
import 'package:oop_task/features/tasks/data/models/parsers/task_model_parser.dart';
import 'package:oop_task/features/tasks/data/models/task_model.dart';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  @override
  List<TaskModel> getLocalData() {
    const rawData = _localData;
    return TaskModelParser.parseList(input: rawData);
  }
}

const String _localData = """
[
  {
    "title" : "Sample Programming task", 
    "description" : "Create E-Commerce client", 
    "type" : "Programming",
    "platform" : "WEB", 
    "language" :"JavaScript"
  },
  {
    "title" : "Sample Math task", 
    "description" : "Solve the calculus", 
    "type" : "Mathematics",
    "field" : "Calculus"
  },
  {
    "title" : "Sample Graphic Design task", 
    "description" : "UX design for E-Commerce", 
    "type" : "Graphics_Design",
    "output" : "Figma"
  }
]
""";
