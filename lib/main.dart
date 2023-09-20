import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/modules/shop/login/Shop_login_screen.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
import 'package:shop/shared/network/remote/dio_helper.dart';
import 'package:shop/shared/styles/themes.dart';

import 'layout/shop_app/bloc_observer.dart';
import 'modules/shop/on_bording/on_boarding_screen.dart';

Future<void> main()async {
  //كل لما احط async مع main لازم اكتب جملة widget flutter binding
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   DioHelper.init();
//  لان init عبارة عن asyncلازم احط await
await CacheHelper.init();
bool? isDark = CacheHelper.getData(key: 'isDark');
  dynamic onBoarding = CacheHelper.getData(key: 'onBoarding');
  print(onBoarding);
  runApp(MyApp(isDark:isDark,
  onBoarding: onBoarding!,));
}
  class MyApp extends StatelessWidget {
  
final bool  ? isDark;
 final dynamic   onBoarding;

  MyApp({
    this.isDark,
      this.onBoarding
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..changeAppMode(fromShared:isDark),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme:lightTheme,

                  // darkTheme:darkTheme,
                  themeMode: AppCubit
                      .get(context)
                      .isDark ? ThemeMode.dark : ThemeMode.light,
                  home:onBoarding ? ShopLoginScreen():OnBoardingScreen()
                  // onBoarding ? ShopLoginScreen() : OnBoardingScreen()


              );
            }
        ));
  }}

