//abstractعشان ماخدش منه object
abstract class ShopLoginState{}
class ShopLoginInitialState extends ShopLoginState{}
class ShopLoginLoadingState extends ShopLoginState{}
class ShopLoginSuccessState extends ShopLoginState{}
class ShopLoginErrorState extends ShopLoginState{
   String ? error;

   ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginState{}
