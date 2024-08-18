import 'package:connectiq_alkaff_pretest/providers/todo_list_controller.dart';
import 'package:connectiq_alkaff_pretest/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchFieldView extends ConsumerWidget {
  const SearchFieldView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = ref.watch(todoListProvider).searchEditingController;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: textController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            suffix: GestureDetector(
                onTap: () {
                  ref.read(todoListProvider).startSearchById();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child:
                    const Text("Search").medium().textColor(Colors.blue[800]!)),
            hintText: "Search by ID",
            border: const OutlineInputBorder()),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
