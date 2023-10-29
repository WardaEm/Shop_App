//base url: https://newsapi.org/
// method(url); v2/top-headlines?
// query: country=us&apiKey=73d5af48b53a4017934a0cf44bf12a3f

//https://newsapi.org/v2/everything?q=tesla&apiKey=73d5af48b53a4017934a0cf44bf12a3f

import 'dart:js';

import 'package:flutter/material.dart';

import '../../modules/shop/login/Shop_login_screen.dart';
import '../network/local/cache_helper.dart';

void signOut() {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value!) {
      Navigator.push(
          context as BuildContext, MaterialPageRoute(builder: (context) => ShopLoginScreen()));
    }
  });
}