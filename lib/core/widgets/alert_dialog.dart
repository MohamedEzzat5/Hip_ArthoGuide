import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/utils/style.dart';

 customAwesomeDialog ({required BuildContext buildContext,
required String title,
required DialogType dialogType,
required String description,
 VoidCallback? cancelOnPressed,
 VoidCallback? okOnPressed,
 AnimType? animType,
 }) {

    return AwesomeDialog(
      context: buildContext,
      showCloseIcon: true,
      animType: animType ?? AnimType.rightSlide,
      dialogType: dialogType,
      title: title,
      btnOkOnPress: okOnPressed,
      desc: description,
      dialogBackgroundColor: Colors.white,
      btnCancelOnPress: cancelOnPressed,
      borderSide: const BorderSide(color: Colors.black),
      alignment: Alignment.center,
      titleTextStyle: Styles.textStyle24,
      descTextStyle: Styles.textStyle18
    ).show();

}
