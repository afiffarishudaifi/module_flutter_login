abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String nama;
  final String password;
  final String nis;

  RegisterButtonPressed(
      {required this.nama, required this.password, required this.nis});
}
