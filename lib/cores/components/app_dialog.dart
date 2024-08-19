import 'dart:async';

import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDialog {
  static showSuccessMessage(BuildContext context,
      {String message = "Success",
      Duration dialogDuration = const Duration(milliseconds: 1500)}) {
    Timer timer = Timer(dialogDuration, () {
      // back to root page
      Navigator.pop(context);
      Navigator.pop(context);
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog.adaptive(
          content: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 55,
                ),
                16.toHeightGap(),
                Text(
                  message,
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        );
      },
    ).then(
      (value) {
        // dispose the timer in case something else has triggered the dismiss.
        timer.cancel();
      },
    );
  }
}
