import 'package:connectiq_alkaff_pretest/cores/configs/api_config.dart';
import 'package:connectiq_alkaff_pretest/models/todo_model.dart';
import 'package:connectiq_alkaff_pretest/services/api_service.dart';
import 'package:connectiq_alkaff_pretest/services/fetch_todo_list.dart';
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

  void init() {
    pagingController.addPageRequestListener((pageKey) {
      fetchTodoList();
    });
  }

  Future<void> fetchTodoList() async {
    try {
      final newItems = await apiService.fetchTodoList(
          start: pagingController.itemList?.length ?? 0);
      final isLastPage =
          (newItems.length + (pagingController.itemList?.length ?? 0)) >=
              ApiConfig.maxItems;

      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
