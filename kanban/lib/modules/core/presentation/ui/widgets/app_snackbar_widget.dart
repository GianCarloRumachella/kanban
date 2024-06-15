import 'package:flutter/material.dart';

class AppSnackbarWidget {
  static snackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
