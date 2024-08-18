import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/presentations/todo_item_view.dart';
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
          itemBuilder: (context, item, index) {
            return TodoItemView(item);
          },
          noMoreItemsIndicatorBuilder: (context) {
            return const Center(child: Text("No more items"));
          },
        ));
  }
}
