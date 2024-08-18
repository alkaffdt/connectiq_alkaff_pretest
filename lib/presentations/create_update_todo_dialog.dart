import 'package:connectiq_alkaff_pretest/cores/components/loading_provider.dart';
import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/providers/todo_list_controller.dart';
import 'package:connectiq_alkaff_pretest/styles/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUpdateTodoDialog extends StatelessWidget {
  CreateUpdateTodoDialog(
      {super.key,
      required this.bodyTextController,
      required this.idTextController,
      required this.titleTextController,
      required this.userIdTextController});

  TextEditingController idTextController;

  TextEditingController userIdTextController;

  TextEditingController titleTextController;

  TextEditingController bodyTextController;

  static void showCreateEditDialog(BuildContext context, {Todo? item}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        TextEditingController idTextController =
            TextEditingController(text: item?.id.toString());
        TextEditingController userIdTextController =
            TextEditingController(text: item?.userId.toString());
        TextEditingController titleTextController =
            TextEditingController(text: item?.title);
        TextEditingController bodyTextController =
            TextEditingController(text: item?.body);

        final isCreate = item?.id == null;

        return AlertDialog.adaptive(
          title: Text(isCreate ? "Create Todo" : "Update Todo"),
          content: Center(
            child: Material(
                color: Colors.transparent,
                child: CreateUpdateTodoDialog(
                    bodyTextController: bodyTextController,
                    idTextController: idTextController,
                    titleTextController: titleTextController,
                    userIdTextController: userIdTextController)),
          ),
          actions: [
            TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text("CANCEL")),
            Consumer(builder: (context, ref, _) {
              return TextButton.icon(
                  style: TextButton.styleFrom(
                      foregroundColor: AppColors.bluePrimary),
                  onPressed: () {
                    AppLoading.show(context, message: "Saving...");

                    final data = {
                      "id": item?.id,
                      "title": titleTextController.text,
                      "body": bodyTextController.text
                    };

                    _submitTodo(context, ref, data: data).whenComplete(
                      () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    );
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("SAVE"));
            })
          ],
        );
      },
    );
  }

  static Future<void> _submitTodo(BuildContext context, WidgetRef ref,
      {required Map<String, dynamic> data}) async {
    final isCreateTodo = data["id"] == null;

    if (isCreateTodo) {
      await ref.read(todoListProvider).createTodo(data);
    } else {
      await ref.read(todoListProvider).updateTodo(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isUpdate = idTextController.text.isNotEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // hide ID & UserID field when create a new Todo
        if (isUpdate) ...[
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
        ],
        TextField(
          controller: titleTextController,
          maxLines: isUpdate ? 2 : 1,
          decoration: const InputDecoration(
            label: Text("Title"),
            icon: Icon(Icons.title),
          ),
        ),
        16.toHeightGap(),
        TextField(
          controller: bodyTextController,
          maxLines: isUpdate ? 5 : 1,
          decoration: const InputDecoration(
            label: Text("Body"),
            icon: Icon(Icons.text_fields_rounded),
          ),
        ),
      ],
    );
  }
}
