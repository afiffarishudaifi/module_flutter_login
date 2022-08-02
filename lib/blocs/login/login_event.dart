abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String nis;
  final String password;

  LoginButtonPressed({required this.nis, required this.password});
}
