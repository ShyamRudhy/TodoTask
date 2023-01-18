import 'package:flutter/material.dart';
import 'colors.dart';
import 'constants.dart';


class CommonUtils{
/*
  static showSuccessToastMessage(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        fontSize: 16.0,
        textColor: Colors.white,
        backgroundColor: SUCCESS_COLOR[400]);
  }

  static showToastError(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        fontSize: 16.0,
        textColor: Colors.white,
        backgroundColor: ERROR_COLOR[200]);
  }

  static Widget noInternetSnackBar(context){

    var _size = MediaQuery.of(context).size;

    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width:_size.width,
            decoration: BoxDecoration(
              color: Colors.redAccent[200],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                Constants.NO_INTERNET,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            )));
  }
*/

  static showSuccessSnackbar(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }


    static showErrorSnackbar(BuildContext context, String message) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
            duration: const Duration(milliseconds: 1000),
        ),
      );
  }
 static showErrorToast(BuildContext context, String message) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
            duration: const Duration(milliseconds: 1000),
        ),
      );
  }

}
