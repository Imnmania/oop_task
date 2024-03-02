import 'package:oop_task/features/tasks/domain/entities/task_entity.dart';

class ProgrammingEntity extends TaskEntity {
  final String platform;
  final String language;

  const ProgrammingEntity({
    required super.title,
    required super.description,
    required super.type,
    required this.platform,
    required this.language,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        type,
        platform,
        language,
      ];
}
