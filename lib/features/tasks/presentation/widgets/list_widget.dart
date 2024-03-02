import 'package:flutter/material.dart';
import 'package:oop_task/features/tasks/data/models/graphics_design_model.dart';
import 'package:oop_task/features/tasks/data/models/mathematics_model.dart';
import 'package:oop_task/features/tasks/data/models/programming_model.dart';
import 'package:oop_task/features/tasks/presentation/states/get_task_cubit.dart';

class ListWidget extends StatelessWidget {
  final GetTaskSuccessState state;
  const ListWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.taskList.length,
      itemBuilder: (context, index) {
        final task = state.taskList[index];
        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title),
                Text(task.description),
                Text(task.type),
                if (task is GraphicsDesignModel) Text(task.output),
                if (task is ProgrammingModel) Text(task.platform),
                if (task is ProgrammingModel) Text(task.language),
                if (task is MathematicsModel) Text(task.field),
              ],
            ),
          ),
        );
      },
    );
  }
}
