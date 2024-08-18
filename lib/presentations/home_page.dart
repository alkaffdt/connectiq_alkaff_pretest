import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
import 'package:connectiq_alkaff_pretest/presentations/create_todo_fab.dart';
import 'package:connectiq_alkaff_pretest/presentations/search_bar_view.dart';
import 'package:connectiq_alkaff_pretest/presentations/todo_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("To-Do Memos"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top margin
            16.toHeightGap(),
            const SearchFieldView(),
            16.toHeightGap(),
            const Expanded(child: TodoListview())
          ],
        ),
        floatingActionButton: const CreateTodoFAB(),
      ),
    );
  }
}
