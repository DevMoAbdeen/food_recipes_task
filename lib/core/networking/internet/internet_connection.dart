import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetConnection {
  Future<bool> get isConnected;
}

class InternetConnectionImp implements InternetConnection {
  final InternetConnectionChecker connectionChecker;

  InternetConnectionImp(this.connectionChecker);

  @override
  Future<bool> get isConnected async => await connectionChecker.hasConnection;
}
