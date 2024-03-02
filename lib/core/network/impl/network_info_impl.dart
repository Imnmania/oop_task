import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:oop_task/core/network/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl({
    required this.dataConnectionChecker,
  });

  @override
  Future<bool> isConnected() => dataConnectionChecker.hasConnection;
}
