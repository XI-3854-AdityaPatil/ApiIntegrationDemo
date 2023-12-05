import 'package:day6_demo/api_client.dart';
import 'package:day6_demo/model/login_request_model.dart';
import 'package:day6_demo/model/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> onLogin(
      {required String userName, required String password}) async {
    emit(const LoginProgressState(isShowProgress: true));
    try {
      var requestModel =
          LoginRequestModel(username: userName, password: password);

      final response = await ApiClient.post(kLoginUrl, requestModel.toJson());

      if (response != null) {
        var responseModel = loginResponseModelFromJson(response.toString());
        emit(const LoginProgressState(isShowProgress: false));
        debugPrint(responseModel.firstName);
      }
    } catch (ex) {
      emit(const LoginProgressState(isShowProgress: false));
      emit(const LoginFailedState(errorMessage: "Something went wrong"));
      debugPrint(ex.toString());
    }
  }
}
