import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class NoConnection extends Failure {
  NoConnection() : super('No connection!');
}

class FireStoreFailure extends Failure {
  final String message;

  FireStoreFailure({required this.message}) : super(message);
}

class FirebaseAuthFailure extends Failure {
  final String message;

  FirebaseAuthFailure({required this.message}) : super(message);
}

class FirebaseStorageFailure extends Failure {
  final String message;

  FirebaseStorageFailure({required this.message}) : super(message);
}