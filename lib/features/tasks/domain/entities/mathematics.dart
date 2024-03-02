import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';

class MathematicsEntity extends TaskEntity {
  final String field;

  const MathematicsEntity({
    required super.title,
    required super.description,
    required super.type,
    required this.field,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        type,
        field,
      ];
}
