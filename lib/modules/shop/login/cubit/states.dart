//abstractعشان ماخدش منه object
import 'package:shop/models/login_model.dart';

abstract class ShopLoginState{}
class ShopLoginInitialState extends ShopLoginState{}
class ShopLoginLoadingState extends ShopLoginState{}
class ShopLoginSuccessState extends ShopLoginState{
 late final LoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopLoginState{
   String ? error;

   ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginState{}
