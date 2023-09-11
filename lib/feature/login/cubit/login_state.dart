part of 'login_cubit.dart';

@immutable
sealed class LoginState extends Equatable {}
//equatable so sanh tung thuoc tinh trong login inittial

final class LoginInitial extends LoginState {
  LoginInitial({
    this.obscureText = true,
  });
  final bool obscureText;

  @override
  List<Object?> get props => [obscureText];
  //liet ke thay doi
}
