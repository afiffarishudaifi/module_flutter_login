import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/blocs/register/register_event.dart';
import 'package:flutter_login/blocs/register/register_state.dart';
import 'package:flutter_login/repositories/registerServices.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(RegisterState initialState) : super(initialState) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterInitial());
      Map<String, dynamic> register = await RegisterService().register(event);
      print(register);
      if (register['errorCode'] == 1) {
        emit(RegisterFinished(
            errorCode: register['errorCode'],
            errorMessage: register['errorMessage']));
      } else {
        emit(RegisterFinished(
            errorCode: 0, errorMessage: 'Sukses registreasi ke apllikasi'));
      }
    });
  }
}
