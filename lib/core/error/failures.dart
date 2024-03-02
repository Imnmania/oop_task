import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final List<dynamic> properties;

  const Failures({
    this.properties = const [],
  });

  @override
  List<Object?> get props => [
        properties,
      ];
}

/// General failures
class ServerFailure extends Failures {}

class InvalidInputFailure extends Failures {}

class CacheFailure extends Failures {}
