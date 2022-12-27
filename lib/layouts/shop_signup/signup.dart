import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/componants/componanszz.dart';
import 'package:shopapp/componants/componants.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/layouts/home_layout/home_layout.dart';
import 'package:shopapp/layouts/shop_login/cubit/state.dart';
import 'package:shopapp/layouts/shop_signup/cubit/state.dart';
import 'package:shopapp/network/end_points.dart';
import 'package:shopapp/network/shared/cache_helper.dart';
import 'cubit/cubit.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var namecontroller = TextEditingController();
    var phonecontroller = TextEditingController();
    var imagecontroller = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ShopSignupCubit(),
      child: BlocConsumer<ShopSignupCubit, ShopSignupState>(
        listener: (context, state) {
          if (ShopSignupCubit.get(context).signupmodel!.status == true) {
            CacheHelper.saveData(
                key: 'token',
                value: ShopSignupCubit.get(context).signupmodel!.data!.token);
            token = ShopSignupCubit.get(context).signupmodel!.data!.token;

            ShopCubit.get(context).getHome();
            ShopCubit.get(context).getCategories();
            ShopCubit.get(context).getFavorites();
            ShopCubit.get(context).getProfile();
            ShopCubit.get(context).getCart();
            Restart.restartApp();
            //NavigateAndKill(context: context, widget: HomeLayoutScreen());
          } else {
            toast(
                msg: ' ${ShopSignupCubit.get(context).signupmodel!.message}',
                state: ToastState.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                      padding: EdgeInsets.symmetric(vertical: 150),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              defaultFormField(
                                controller: namecontroller,
                                label: 'name',
                                prefix: Icons.person,
                                type: TextInputType.emailAddress,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'add your name';
                                  }
                                  // return null;
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                controller: passwordcontroller,
                                label: 'password',
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
                              const SizedBox(
                                height: 20,
                              ),
                              defaultFormField(
                                controller: phonecontroller,
                                label: 'Phone',
                                prefix: Icons.phone,
                                type: TextInputType.phone,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'add your phone';
                                  }
                                  // return null;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              MaterialButton(
                                color: colorItem,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopSignupCubit.get(context).userSignup(
                                        name: namecontroller.text,
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text,
                                        phone: phonecontroller.text);
                                  }
                                },
                                child: state is ShopSignupLoadingState
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 3,
                                      )
                                    : const Text(
                                        'REGISTER',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ],
                          ),
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




/***
 
 
                            

 */
