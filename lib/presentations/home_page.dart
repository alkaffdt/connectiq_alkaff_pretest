import 'package:connectiq_alkaff_pretest/cores/extensions/int_extensions.dart';
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
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top margin
            Expanded(child: TodoListview())
          ],
        ),
      ),
    );
  }
}
