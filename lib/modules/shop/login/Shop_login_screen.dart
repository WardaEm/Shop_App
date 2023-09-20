import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/modules/shop/login/cubit/cubit.dart';
import 'package:shop/modules/shop/login/cubit/states.dart';
import 'package:shop/shared/styles/colors.dart';

import '../register/shop_register_screen.dart';

class ShopLoginScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();

  ShopLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();

    return BlocProvider(
        create: (context) => ShopLoginCubit(),
        child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
          listener: (context, state) {
            if(state is ShopLoginSuccessState){
              if(state.loginModel.status){
                print(state.loginModel.data?.token);
                print(state.loginModel.message);

                Fluttertoast.showToast(
                    msg:state.loginModel.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
              else
                {
                  print(state.loginModel.message);
                  Fluttertoast.showToast(
                      msg:state.loginModel.message,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
            }
          },
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOGIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: Colors.black),
                            ),
                            Text(
                              'login now to browse our hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'please enter your email address';
                                }
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Email Address',
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                  ),
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordcontroller,
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text);
                                }
                              },
                              obscureText:
                                  ShopLoginCubit.get(context).isShowPassword,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'password is too short';
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    ShopLoginCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                  child:
                                      ShopLoginCubit.get(context).isShowPassword
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                            Container(
                                width: double.infinity,
                                child: ConditionalBuilder(
                                  condition: state is! ShopLoginLoadingState,
                                  builder: (context) => MaterialButton(
                                    color: defaultColor,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        ShopLoginCubit.get(context).userLogin(
                                            email: emailcontroller.text,
                                            password: passwordcontroller.text);
                                      }
                                    },
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  fallback: (context) => Center(
                                      child: ColorfulCircularProgressIndicator(
                                    colors: [
                                      Colors.blue,
                                      Colors.red,
                                      Colors.amber,
                                      Colors.green
                                    ],
                                    strokeWidth: 5,
                                    indicatorHeight: 40,
                                    indicatorWidth: 40,
                                  )),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dont have an account ? ',
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ShopRegisterScreen()));
                                    },
                                    child: Text('Register'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}
