import 'package:flutter/material.dart';

mixin MySnackbar {
  void showCustomSnackBar(
      {required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }
}
