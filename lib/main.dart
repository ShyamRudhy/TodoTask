import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projects/common/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:projects/pages/add_task/add_campaign.dart';
import 'package:projects/pages/home/homee_page.dart';
import 'package:projects/pages/splash/splash_page.dart';
import 'common/constants.dart';
import 'common/dimensions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //disable demo flag
      debugShowCheckedModeBanner:false,
      title: 'ToDoList',
      theme: _buildTheme(),
      initialRoute: '/',
      routes: {
      '/':(context) => SplashPage(),
        Constants.HOME_PAGE_ROUTE:(context) => const HomePage(),
        Constants.ADD_CAMPAIGN_PAGE_ROUTE:(context) => const AddCampaign(),
      },

    );
  }


  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: PRIMARY_COLOR,
      backgroundColor: BACKGROUND_COLOR,
      appBarTheme: _appBarTheme(base.appBarTheme),
      textTheme: _textTheme(base.textTheme),
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: ACCENT_COLOR,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ACCENT_COLOR),
    );
  }

  AppBarTheme _appBarTheme(AppBarTheme base) => base.copyWith(
      color: BACKGROUND_COLOR,
      iconTheme: const IconThemeData(color: ACCENT_COLOR), systemOverlayStyle: SystemUiOverlayStyle.dark, toolbarTextStyle: const TextTheme(
          headline6: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              fontFamily: Constants.FONT_NAME_POPPINS,
              color: ACCENT_COLOR)).bodyText2, titleTextStyle: const TextTheme(
          headline6: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              fontFamily: Constants.FONT_NAME_POPPINS,
              color: ACCENT_COLOR)).headline6);

  TextTheme _textTheme(TextTheme base) {
    return base.copyWith(

      headline1: base.headline1?.copyWith(
          fontWeight: FontWeight.w500,
          fontFamily: Constants.FONT_NAME_POPPINS,
          color: PRIMARY_TEXT_COLOR),

      subtitle1: base.subtitle1?.copyWith(
        //fontSize: TITLE_FONT_SIZE,
        //    fontWeight: FontWeight.w600,
          fontFamily: Constants.FONT_NAME_POPPINS,
          color: PRIMARY_TEXT_COLOR),

      caption: base.caption?.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: Constants.FONT_NAME_POPPINS,
          //  fontSize: TEXT_FONT_SIZE,
          color: PRIMARY_TEXT_COLOR),

      bodyText1: base.bodyText1?.copyWith(
          fontWeight: FontWeight.w300,
          fontFamily: Constants.FONT_NAME_POPPINS,
          //   fontSize: TEXT_FONT_SIZE,
          color: PRIMARY_TEXT_COLOR),

      bodyText2: base.bodyText2?.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: Constants.FONT_NAME_POPPINS,
          //  fontSize: TEXT_LARGE_FONT_SIZE,
          color: PRIMARY_TEXT_COLOR),

      button: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: Constants.FONT_NAME_POPPINS,
          fontSize: BUTTON_TEXT_NORMAL_FONT_SIZE),
    );
  }




  Widget loadingIndicator(BuildContext context){
    return const LoadingIndicator(
      indicatorType: Indicator.ballPulse,
      colors: [Colors.white],
      strokeWidth: 2,
      backgroundColor: Colors.black,
      pathBackgroundColor: Colors.black,
    );

  }
}
