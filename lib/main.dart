import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/layout/shop_app/cubit/states.dart';
import 'package:shop/layout/shop_app/shop_layout.dart';
import 'package:shop/modules/shop/login/Shop_login_screen.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';
import 'package:shop/shared/styles/themes.dart';

import 'layout/shop_app/bloc_observer.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'modules/shop/on_bording/on_boarding_screen.dart';

Future<void> main()async {
  //كل لما احط async مع main لازم اكتب جملة widget flutter binding
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   DioHelper.init();
//  لان init عبارة عن asyncلازم احط await
await CacheHelper.init();
  dynamic isDark = CacheHelper.getData(key: 'isDark') ;
  Widget widget;
  dynamic   onBoarding = CacheHelper.getData(key: 'onBoarding') ;
  dynamic   token = CacheHelper.getData(key: 'token') ;
  if(onBoarding!=null){
    if(token !=null) widget = ShopLayout();
    else  widget = ShopLoginScreen();
  }else{
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
     isDark:isDark,
    startWidget: widget));
}
  class MyApp extends StatelessWidget {
  
final  bool ?  isDark;
final Widget ? startWidget;

  MyApp({
      this.isDark,
       this.startWidget
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
        // ..changeAppMode(fromShared:isDark),
        child: BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme:lightTheme,

                  // darkTheme:darkTheme,
                  // themeMode: AppCubit
                  //     .get(context)
                  //     .isDark ? ThemeMode.dark : ThemeMode.light,
                  home:startWidget
                  // onBoarding ? ShopLoginScreen() : OnBoardingScreen()


              );
            }
        ));
  }}

