import 'package:flutter/material.dart';
import 'package:shop/modules/shop/login/Shop_login_screen.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('salla'),
      ),
      body: TextButton(onPressed: (){
        CacheHelper.removeData(key: 'token').then((value){
          if(value!){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopLoginScreen()));
          }
        });
      },child:Text('SIGNOUT') ,)
    );
  }
}
