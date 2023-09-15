import 'package:shared_preferences/shared_preferences.dart';
//بنعرف class
class CacheHelper{
  //بنعرف الshared كمتغير
  static SharedPreferences ? sharedPreferences;
  //بنعرف ميثود init
  static init()async {
    //داخل الميثود بناخد instanse منshared
    sharedPreferences = await SharedPreferences.getInstance();
  }
  // بستخدم معاها setBool اول ميتود بنعملها هي putBoolean
  static  Future<bool> putBoolean({
      required String key,
      required bool value,
    })async
    {
      //داخل الميثود بناخد المتغير اللي احنا عرفناه .set النوع اللي اشتغل عليه الset boolبترجع future bool
     return await sharedPreferences!.setBool(key, value);
    }
  // بستخدم معاها getbool تاني ميثود انعملها هي getBoolean
  static bool? getBoolean({
    required String key,
  })
  {
    //داخل الميثود بناخد المتغير اللي احنا عرفناه .set النوع اللي اشتغل عليه الset boolبترجع future bool
   return  sharedPreferences!.getBool(key);
  }
  }

