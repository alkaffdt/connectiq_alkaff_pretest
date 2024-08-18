import 'package:connectiq_alkaff_pretest/cores/configs/api_config.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/services/api_service.dart';
import 'package:connectiq_alkaff_pretest/services/fetch_todo_list.dart';
import 'package:connectiq_alkaff_pretest/services/search_todo_by_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final todoListProvider = Provider<TodoListController>((ref) {
  return TodoListController(ref.watch(apiServiceProvider))..init();
});

class TodoListController {
  TodoListController(this.apiService) : super();

  final ApiService apiService;

  final PagingController<int, Todo> pagingController =
      PagingController(firstPageKey: 0);

  TextEditingController searchEditingController = TextEditingController();

  void init() {
    pagingController.addPageRequestListener((pageKey) {
      fetchTodoList();
    });
  }

  Future<void> fetchTodoList() async {
    try {
      final int? searchById = searchEditingController.text.isNotEmpty
          ? int.parse(searchEditingController.text)
          : null;

      final List<Todo> newItems;

      if (searchById != null) {
        newItems = await apiService.searchTodoById(searchById: searchById);
      } else {
        newItems = await apiService.fetchTodoList(
            start: pagingController.itemList?.length ?? 0);
      }

      final isLastPage =
          (newItems.length + (pagingController.itemList?.length ?? 0)) >=
              ApiConfig.maxItems;

      // append to last page if searchByID
      // or isLastPage
      if (isLastPage || searchById != null) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void startSearchById() {
    pagingController.refresh();
  }

  void remoteItem(int index) {
    pagingController.value.itemList?.remove(index);
  }
}
