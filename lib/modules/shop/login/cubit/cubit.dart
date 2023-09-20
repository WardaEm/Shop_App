import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/login_model.dart';
import 'package:shop/modules/shop/login/cubit/states.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/endpoints.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
   ShopLoginCubit() :super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
late LoginModel loginModel ;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value?.data);
     loginModel= LoginModel.fromJson(value?.data);
     // print(loginModel.status);
      // print(loginModel.message);

      // print(loginModel.data?.token);
      // print(loginModel.data?.email);

      // print(value?.data['message']);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error) {
      print(error);
      emit(ShopLoginErrorState(error.toString()));
    });
  }


  // IconData suffix = Icons.visibility;
  bool isShowPassword = true;
  void changePasswordVisibility (){
    isShowPassword= !isShowPassword;
    emit(ShopChangePasswordVisibilityState());
  }

}
