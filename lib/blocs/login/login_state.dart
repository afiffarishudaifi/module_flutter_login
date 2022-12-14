abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFinished extends LoginState {
  final int errorCode;
  final String errorMessage;

  LoginFinished({required this.errorCode, required this.errorMessage});
}

class LogoutFinished extends LoginState {
  final int errorCode;
  final String errorMessage;

  LogoutFinished({required this.errorCode, required this.errorMessage});
}
