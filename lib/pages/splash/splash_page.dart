import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projects/common/asset_path.dart';
import 'package:projects/common/dimensions.dart';
import 'package:projects/common/constants.dart';
import 'package:projects/common/colors.dart';
import 'package:projects/pages/home/homee_page.dart';


class SplashPage extends StatefulWidget {
  @override
  State createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  var width;
  var height;
  late bool _isLoggedIn;
  String status = "";


  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    offset = Tween<Offset>(begin: const Offset(2.0, 0.0), end: Offset.zero).animate(controller);
    controller.forward();
    startTimeout();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigateUser);
  }


  void navigateUser() async{

  /*  // check if user already loggedIn then keep user loggedIn else OnboardMessagePage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(Constants.LOGIN_STATUS_KEY)!;
    print("_isLoggedIn :$_isLoggedIn");
    Route route = MaterialPageRoute(builder: (context) => _isLoggedIn == null ?  LoginPage() : HomePage());    //as like activity.finish
    Navigator.pushReplacement(context, route);
*/

    Route route = MaterialPageRoute(builder: (context) => const HomePage());    //as like activity.finish
    Navigator.pushReplacement(context, route);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlideTransition(
                  position: offset,
                  child:
                  Container(
                      height:SPLASH_LOGO_HEIGHT ,
                      width: SPLASH_LOGO_WIDTH,
                      decoration: const BoxDecoration(image: DecorationImage(
                        image: AssetImage(AssetsPath.PATH_LOGO),
                      ),)),
                ),
                const SizedBox(height: DEFAULT_SPACING,)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    //new Padding(padding: EdgeInsets.only(bottom: 55.0),),
                    Text("version ${Constants.APP_VERSION}",style: TextStyle(color: PRIMARY_TEXT_COLOR_BLACK),),
                    SizedBox(height: DEFAULT_SPACING_MIN,),
                  ]
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget logo() => const Image(
    image: AssetImage(AssetsPath.PATH_LOGO),
    height: SPLASH_LOGO_HEIGHT,
    width: SPLASH_LOGO_WIDTH,
  );
}
