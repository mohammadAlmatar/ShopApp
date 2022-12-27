import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/componants/componanszz.dart';
import 'package:shopapp/componants/componants.dart';
import 'package:shopapp/network/shared/cache_helper.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);
  // saveprev() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('name', 'laith');
  //   print('succses');
  // }

  // getprev() async {
  //   var user;
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   user = preferences.getString('name');
  //   print(user);
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 50,
                child: defaultButton(
                  function: () {
                    saveData(key: 'key', value: 1234);
                  },
                  text: 'add',
                  background: Colors.red,
                  isUpperCase: true,
                  radius: 50,
                  width: 50,
                ),
              ),
              Container(
                height: 50,
                child: defaultButton(
                  function: () async {
                    var getted = await getData(key: 'key');
                    print(getted);
                  },
                  text: 'get',
                  background: Colors.blue,
                  isUpperCase: true,
                  radius: 50,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
