import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DTLoading {
  static show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog.adaptive(
          content: Container(
            color: Colors.grey,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                16.toHeightGap(),
                const Text(
                  "Sedang diproses...",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
