import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;
  final int code;

  const Failure({  this.msg = '',   this.code = -1});
  List<Object?> get props =>[msg,code];

}

class ServerFailure extends Failure {
  const ServerFailure({  super.msg,   super.code});
}
class LocalFailure extends Failure {
  const LocalFailure({  super.msg,   super.code});
}
class SameFailure extends Failure {
  const SameFailure({  super.msg,   super.code});
}