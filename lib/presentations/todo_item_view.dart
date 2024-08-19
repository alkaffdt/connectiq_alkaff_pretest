import 'package:connectiq_alkaff_pretest/cores/components/app_loading.dart';
import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/presentations/create_update_todo_dialog.dart';
import 'package:connectiq_alkaff_pretest/providers/todo_list_controller.dart';
import 'package:connectiq_alkaff_pretest/styles/const_colors.dart';
import 'package:connectiq_alkaff_pretest/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoItemView extends ConsumerWidget {
  const TodoItemView(this.item, {super.key});

  final Todo item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      // right swipe
      background: Container(
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft,
            child: const Text("   Delete").fontSize(24)),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerRight,
            child: const Text("Delete   ").fontSize(24)),
      ),
      confirmDismiss: (direction) {
        return dismissConfirmation(context);
      },
      onDismissed: (direction) {
        AppLoading.show(context, message: "Deleting...");

        ref.read(todoListProvider).deleteTodo(item.id).whenComplete(
          () {
            Navigator.pop(context);
          },
        );
      },
      key: UniqueKey(),
      child: GestureDetector(
        onTap: () {
          CreateUpdateTodoDialog.showCreateEditDialog(context, item: item);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${item.id}: ${item.title}").fontSize(16).medium(),
                8.toHeightGap(),
                Text(item.body ?? ""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> dismissConfirmation(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("CANCEL"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("DELETE"),
            ),
          ],
        );
      },
    );
  }
}
