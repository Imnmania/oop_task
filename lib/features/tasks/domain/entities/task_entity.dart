import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String title;
  final String description;
  final String type;

  const TaskEntity({
    required this.title,
    required this.description,
    required this.type,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        type,
      ];
}
