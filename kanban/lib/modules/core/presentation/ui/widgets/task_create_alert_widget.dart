import 'package:flutter/material.dart';

class TaskCreateAlertWidget {
  static alert({
    required BuildContext context,
    required String title,
    required List<Widget> body,
    required Widget buttons,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: title.isEmpty
              ? Container()
              : Center(
                  child: Text(
                    title,
                  ),
                ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: body,
          ),
          actions: [buttons],
        );
      },
    );
  }
}
