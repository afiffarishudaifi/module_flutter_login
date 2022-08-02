import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/blocs/login/login_event.dart';
import 'package:flutter_login/blocs/login/login_state.dart';
import 'package:flutter_login/repositories/loginServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginInitial());

      Map<String, dynamic> login =
          await LoginServices().login(event.nis, event.password);
      print(login);
      if (login['errorCode'] != 0) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt("id", login['id']);
        await prefs.setString("nama", login['nama']);
      }
      emit(LoginFinished(
          errorCode: login['errorCode'], errorMessage: login['errorMessage']));
    });
  }
}
