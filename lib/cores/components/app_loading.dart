import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLoading {
  static show(BuildContext context, {String message = "On Progress..."}) {
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
                const CircularProgressIndicator.adaptive(),
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
    );
  }
}
