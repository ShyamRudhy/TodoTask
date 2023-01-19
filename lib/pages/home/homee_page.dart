import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:projects/common/colors.dart';
import 'package:projects/common/constants.dart';
import 'package:projects/common/common_utils.dart';
import 'package:projects/common/dimensions.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              CommonUtils.showSuccessSnackbar(context,'back pressed' );
            },
            child: const Icon(
                Icons.arrow_back_ios_sharp,color: PRIMARY_WHITE_COLOR,),),
        backgroundColor: ACCENT_COLOR,
        centerTitle: true,
        title: const Text(
          Constants.HOME_PAGE_TITLE,
          style: TextStyle(fontSize: 20.0,color: PRIMARY_TEXT_COLOR,decoration: TextDecoration.none,
              fontWeight: FontWeight.w500),
        ) ,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
             onTap: (){},
               child: const Icon(Icons.add_box_outlined,color: PRIMARY_WHITE_COLOR,)),
          ) ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: (){},
                child: const Icon(Icons.more_vert,color: PRIMARY_WHITE_COLOR,)),
          ) ,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DEFAULT_MIN_PADDING,vertical: DEFAULT_MIN_PADDING),
        child: ListView(
          children:  [
            Card(

              elevation: DEFAULT_MIN_ELEVATION,
              child: TextField(
                style: const TextStyle(color: PRIMARY_TEXT_COLOR_BLACK
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(DEFAULT_ELEVATION),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  filled: true,
                  prefixIcon: const Icon(Icons.search_rounded,color: ACCENT_COLOR,),
                  hintText: 'Search',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








