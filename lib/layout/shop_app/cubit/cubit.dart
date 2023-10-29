import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/shop_app/cubit/states.dart';
import 'package:shop/modules/shop/categories/categories_screen.dart';
import 'package:shop/modules/shop/favourite/favourites_screen.dart';
import 'package:shop/modules/shop/products/products_screen.dart';
import 'package:shop/modules/shop/settings/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit(): super(ShopInitialState());
static ShopCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;
List<Widget>bottomScreen =[
  ProductsScreen(),
  CategoriesScreen(),
  FavouriteScreen(),
  SettingScreen(),
];
void changeBottom(int index){
  currentIndex=index;
  emit(ShopChangeBottomNavState());
}

}