import 'package:flutter/material.dart';
class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('salla'),
      ),
      body: TextButton(onPressed: (){},child:Text('SIGNOUT') ,)
    );
  }
}
