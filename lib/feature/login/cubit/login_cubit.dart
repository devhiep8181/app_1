import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  toggleHidePassword() {
    //nham mat mo mat
    final bool currentValue =
        (state as LoginInitial).obscureText; //lay ra gia tri hien tai
    emit(LoginInitial(
      obscureText: !currentValue,
    )); //ban thong bao
  }
}
