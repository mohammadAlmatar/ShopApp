import 'package:flutter/material.dart';
import 'package:shopapp/componants/componants.dart';
import 'package:shopapp/layouts/shop_login/login.dart';
import 'package:shopapp/network/shared/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class bordingmodel {
  final String image;
  final String title;
  final String body;
  bordingmodel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBording extends StatefulWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  @override
  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      NavigateAndKill(
        context: context,
        widget: Login(),
      );
    });
  }

  var boardcontroller = PageController();
  bool isLast = false;

  List<dynamic> bording = [
    bordingmodel(
        image: 'assets/onbbb.png',
        title: 'OnBOARDING 1 TITLE ',
        body: 'ONBORDING 1 BODY'),
    bordingmodel(
        image: 'assets/asd.png',
        title: 'OnBOARDING 2 TITLE ',
        body: 'ONBORDING 2 BODY'),
    bordingmodel(
        image: 'assets/onboardig3.png',
        title: 'OnBOARDING 3 TITLE ',
        body: 'ONBORDING 3 BODY')
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [TextButton(onPressed: submit, child: Text('SKIP'))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                  controller: boardcontroller,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (index == bording.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast == false;
                      });
                    }
                  },
                  itemBuilder: (context, n) => Itemonbording(bording[n]),
                  itemCount: bording.length,
                )),
                Row(
                  children: [
                    SmoothPageIndicator(
                        controller: boardcontroller,
                        effect: const ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5,
                          expansionFactor: 4,
                        ),
                        count: bording.length),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          if (isLast) {
                            submit();
                          } else {
                            boardcontroller.nextPage(
                                duration: Duration(microseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
                        },
                        icon: Icon(Icons.arrow_right_alt_outlined)),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

Widget Itemonbording(bordingmodel list) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${list.image}'),
          ),
        ),
        Text(
          '${list.title}',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${list.body}',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
