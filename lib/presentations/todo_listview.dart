import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/providers/todo_list_controller.dart';
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
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            return Card(
              child: Column(
                children: [
                  Text(item.id.toString()),
                ],
              ),
            );
          },
        ));
  }
}
