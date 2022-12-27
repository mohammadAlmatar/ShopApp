import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/componants/colors.dart';
import 'package:shopapp/componants/componants.dart';
import 'package:shopapp/componants/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorHome,
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Lottie.asset(
        'assets/startscreen.json',
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(
              () => NavigateAndKill(
                context: context,
                widget: startWidget,
              ),
            );
        },
      ),
    );
  }
}
