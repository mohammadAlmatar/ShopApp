import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/componants/componanszz.dart';
import 'package:shopapp/componants/componants.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/layouts/home_layout/home_layout.dart';
import 'package:shopapp/layouts/shop_login/cubit/cubit.dart';
import 'package:shopapp/layouts/shop_login/cubit/state.dart';
import 'package:shopapp/layouts/shop_signup/signup.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/shared/cache_helper.dart';

import '../shop_signup/cubit/cubit.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var cubit=ShopLoginCubit.get(context);

    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSucssesState) {
            if (state.loginmodel.state) {
              toast(state: ToastState.SUCCESS, msg: state.loginmodel.message);
              CacheHelper.saveData(
                key: 'token',
                value: state.loginmodel.data.token,
              );
              token = ShopSignupCubit.get(context).signupmodel!.data!.token;
              // ShopCubit()
              //   ..getCart()
              //   ..getProfile()
              //   ..getHome()
              //   ..getFavorites()
              //   ..getCategories();
              ShopCubit.get(context).getHome();
              ShopCubit.get(context).getCategories();
              ShopCubit.get(context).getFavorites();
              ShopCubit.get(context).getProfile();
              ShopCubit.get(context).getCart();
              NavigateAndKill(widget: HomeLayoutScreen(), context: context);
            } else {
              toast(state: ToastState.ERROR, msg: state.loginmodel.message);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: colorHome,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2.8,
                          color: colorItem,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).size.height / 2.8,
                          width: double.infinity,
                          color: colorHome,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 200),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          height: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(children: [
                            const SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                              controller: emailcontroller,
                              label: 'email address',
                              prefix: Icons.email,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'add your email';
                                }
                                // return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                              controller: passwordcontroller,
                              label: 'passeord',
                              prefix: Icons.lock,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'password is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              color: colorItem,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text);
                                }
                              },
                              child: state is ShopLoginLoadingState
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'DON\'t HAVE A ACCOUNT??',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(context, SignUp());
                                    },
                                    child: const Text(
                                      'SIGN NOW',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/**ShopLoginCubit.get(context).userLogin(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text, */