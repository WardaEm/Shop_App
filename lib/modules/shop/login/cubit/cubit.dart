import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/modules/shop/login/cubit/states.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/endpoints.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() :super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

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
      emit(ShopLoginSuccessState());
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
