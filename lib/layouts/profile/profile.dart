import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/cubit/cubit.dart';
import 'package:shopapp/cubit/states.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userController = TextEditingController(
        text: '${ShopCubit.get(context).profile.data!.name}');
    var userPhone = TextEditingController(
        text: '${ShopCubit.get(context).profile.data!.phone}');
    var userEmail = TextEditingController(
        text: '${ShopCubit.get(context).profile.data!.email}');
    var userPassword = TextEditingController(
        text: '${ShopCubit.get(context).profile.data!.points}');
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: colorItem,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: colorHome,
                  height: MediaQuery.of(context).size.height / 2.9,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        child: CustomPaint(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                          painter: HeaderCurvedContainer(),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 25,
                        child: const Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Good Fonts',
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 9,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${ShopCubit.get(context).profile.data!.image}'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (state is UpdateProfileLoading)
                      const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: LinearProgressIndicator(),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: userController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ShopCubit.get(context).readonly =
                                  !ShopCubit.get(context).readonly;
                            },
                            icon: Icon(Icons.edit),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: userEmail,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ShopCubit.get(context).readonly =
                                  !ShopCubit.get(context).readonly;
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: userPhone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ShopCubit.get(context).readonly =
                                  !ShopCubit.get(context).readonly;
                            },
                            icon: Icon(Icons.edit),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.phone),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        readOnly: false,
                        onChanged: (String value) {
                          userPassword.text = value;
                        },
                        controller: userPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              ShopCubit.get(context).readonly =
                                  !ShopCubit.get(context).readonly;
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.password),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print(state);
                        ShopCubit.get(context).updateProfile(
                          name: userController.text,
                          email: userEmail.text,
                          phone: userPhone.text,
                          points: userPassword.text,
                        );
                        print('asdasdasd');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorItem),
                          child: const Center(
                            child: Text(
                              'update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Good Fonts'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = colorItem;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
  // Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //            const  Padding(
  //               padding: EdgeInsets.all(20),
  //               child: Text(
  //                 "Profile",
  //                 style: TextStyle(
  //                   fontSize: 35,
  //                   letterSpacing: 1.5,
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ),
             
  //           ],
  //         ),
         