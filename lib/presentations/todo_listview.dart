import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/providers/todo_list_controller.dart';
import 'package:connectiq_alkaff_pretest/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TodoListview extends ConsumerStatefulWidget {
  const TodoListview({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoListviewState();
}

class _TodoListviewState extends ConsumerState<TodoListview> {
  @override
  Widget build(BuildContext context) {
    final pagingController = ref.watch(todoListProvider).pagingController;

    return PagedListView<int, Todo>(
        padding: const EdgeInsets.all(16),
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          noMoreItemsIndicatorBuilder: (context) {
            return const Center(child: Text("No more items"));
          },
          itemBuilder: (context, item, index) {
            return Card(
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
            );
          },
        ));
  }
}
