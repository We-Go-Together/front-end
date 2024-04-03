import '../../../domain/entity/todo_item.dart';

class TodoItemState {
  final bool isLoading;
  final bool isEmpty;
  final List<TodoItem> items;
  final String? errorMessage;

  const TodoItemState(
      {this.isLoading = false,
      this.isEmpty = false,
      this.items = const [],
      this.errorMessage});

  factory TodoItemState.initial() => const TodoItemState();

  factory TodoItemState.loading() => const TodoItemState(isLoading: true);

  factory TodoItemState.empty() => const TodoItemState(isEmpty: true);

  factory TodoItemState.success(List<TodoItem> items) =>
      TodoItemState(items: items);

  factory TodoItemState.error(String errorMessage) =>
      TodoItemState(errorMessage: errorMessage);
}
