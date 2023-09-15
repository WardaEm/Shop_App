import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/modules/shop/login/cubit/states.dart';

class ShopLoginCubit extends Cubit<ShopLoginState>{
  ShopLoginCubit(super.initialState);
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
}