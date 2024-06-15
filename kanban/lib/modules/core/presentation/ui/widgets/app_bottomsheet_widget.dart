import 'package:flutter/material.dart';

class AppBottomsheetWidget {
  static bottomsheet({
    required BuildContext context,
    required List<Widget> body,
  }) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * .5,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: body,
            ),
          ),
        );
      },
    );
  }
}
