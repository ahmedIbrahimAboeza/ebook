import '../../../Model/login_model.dart';

abstract class ShopRegisterStates {}

class ShopLoginInitialStates extends ShopRegisterStates {}

class ShopLoginChangeSuffixStates extends ShopRegisterStates {}

class ShopUserDataLoadingLoginStates extends ShopRegisterStates {}

class ShopUserDataSuccessLoginStates extends ShopRegisterStates {
  final LoginModel loginModel;
  ShopUserDataSuccessLoginStates(this.loginModel);
}

class ShopUserDataErrorLoginStates extends ShopRegisterStates {
  final String error;
  ShopUserDataErrorLoginStates(this.error);
}

class ShopLayoutLoadingChangePasswordStates extends ShopRegisterStates {}

class ShopLayoutErrorChangePasswordStates extends ShopRegisterStates {
  final String error;
  ShopLayoutErrorChangePasswordStates(this.error);
}

class ShopLayoutLoadingRegisterStates extends ShopRegisterStates {}

class ShopLayoutSuccessRegisterStates extends ShopRegisterStates {
  final LoginModel registerModel;

  ShopLayoutSuccessRegisterStates(this.registerModel);
}

class ShopLayoutErrorRegisterStates extends ShopRegisterStates {
  final String error;
  ShopLayoutErrorRegisterStates(this.error);
}
