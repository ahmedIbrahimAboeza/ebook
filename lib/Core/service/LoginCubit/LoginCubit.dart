import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/login_model.dart';
import '../httpHandler.dart';
import 'LoginStates.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopLoginInitialStates());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopLoginChangeSuffixStates());
  }

  late LoginModel loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopUserDataLoadingLoginStates());
  }
}
