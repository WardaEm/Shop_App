import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/shared/styles/colors.dart';

import '../register/shop_register_screen.dart';
class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailcontroller=TextEditingController();
    var passwordcontroller=TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('LOGIN',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.black
                  )
                  ,),
                Text('login now to browse our hot offers',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey
                  )
                  ,),
                SizedBox(height: 30,),
TextFormField(
  controller:emailcontroller ,
  keyboardType: TextInputType.emailAddress,
  validator:(String ? value) {
    if(value!.isEmpty){
    return 'please enter your email address';
    }
    },

  decoration: InputDecoration(
    labelText: 'Email Address',
    prefixIcon:Icon( Icons.email_outlined,),
    border: OutlineInputBorder()
  ),



),
                SizedBox(height: 15,),
                TextFormField(
                  controller:passwordcontroller ,
                  keyboardType: TextInputType.visiblePassword,
                  validator:(String ? value) {
                    if(value!.isEmpty){
                      return 'password is too short';
                    }
                  },

                  decoration: InputDecoration(
                      labelText: 'Password',

                      suffixIcon: Icon(Icons.visibility),
                      prefixIcon:Icon( Icons.lock_outline,),
                      border: OutlineInputBorder()
                  ),



                ),
     Container(width: double.infinity,
             child: MaterialButton(color:defaultColor,onPressed: (){},child: Text('LOGIN',style: TextStyle(color: Colors.white,),),)),
                SizedBox(height: 15,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Dont have an account ? ',),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopRegisterScreen()));
                  }, child: Text('Register'))

                ],)
                       ],
            ),
          ),
        ),
      ),
    );
  }
}
