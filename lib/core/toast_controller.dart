import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A [ToastController] widget is a widget that describes part of the user interface by ToastController
/// * [mModelStaffMember] which contains the Toast Text
/// * [BuildContext] which contains the Toast context
/// * [bool] which contains the isSuccess or not
class ToastController {
  static showToast(
    String message,
    BuildContext context,
    bool isSuccess, {
    bool isLong = false,
  }) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: isLong ? 4 : 2,
        backgroundColor: isSuccess ? Colors.green : Colors.redAccent,
        textColor: Colors.white,
        webShowClose: true,
        webPosition: 'center',
        webBgColor: isSuccess
            ? 'linear-gradient(to right, #2E7D32, #2E7D32)'
            : 'linear-gradient(to right, #fe4f4f, #fe4f4f)',
        fontSize: 16.0);
  }

  static removeToast(BuildContext context) {
    Fluttertoast.cancel();
  }
}
