part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginProgressState extends LoginState {
  final bool isShowProgress;

  const LoginProgressState({required this.isShowProgress});
}

class LoginFailedState extends LoginState {
  final String errorMessage;

  const LoginFailedState({required this.errorMessage});
}
