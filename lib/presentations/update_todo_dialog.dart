import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:flutter/material.dart';

class UpdateTodoDialog extends StatelessWidget {
  UpdateTodoDialog(
      {super.key,
      required this.bodyTextController,
      required this.idTextController,
      required this.titleTextController,
      required this.userIdTextController});

  TextEditingController idTextController;

  TextEditingController userIdTextController;

  TextEditingController titleTextController;

  TextEditingController bodyTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: idTextController,
          enabled: false,
          decoration: const InputDecoration(
              label: Text("Todo ID"), icon: Icon(Icons.key_rounded)),
        ),
        16.toHeightGap(),
        TextField(
          controller: userIdTextController,
          enabled: false,
          decoration: const InputDecoration(
              label: Text("User ID"), icon: Icon(Icons.person)),
        ),
        16.toHeightGap(),
        TextField(
          controller: titleTextController,
          maxLines: 2,
          decoration: const InputDecoration(
            label: Text("Title"),
            icon: Icon(Icons.title),
          ),
        ),
        16.toHeightGap(),
        TextField(
          controller: bodyTextController,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text("Body"),
            icon: Icon(Icons.text_fields_rounded),
          ),
        ),
      ],
    );
  }
}
