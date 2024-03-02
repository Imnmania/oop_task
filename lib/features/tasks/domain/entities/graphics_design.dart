import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';

class GraphicsDesignEntity extends TaskEntity {
  final String output;

  const GraphicsDesignEntity({
    required super.title,
    required super.description,
    required super.type,
    required this.output,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        type,
        output,
      ];
}
