part of 'todo_bloc.dart';

// Goal에 귀속되어야함. 이에 해당하는 Entity 설계 필요.
class TodoState {
  final bool isLoading;
  final bool isEmpty;
  final List<TodoItem> items;
  final String? errorMessage;

  const TodoState({
    this.isLoading = false,
    this.isEmpty = false,
    this.items = const [],
    this.errorMessage,
  });

  //factory keyword -> singleton 패턴을 사용하기 위한 키워드.
  factory TodoState.initial() => const TodoState();

  factory TodoState.loading() => const TodoState(isLoading: true);

  factory TodoState.empty() => const TodoState(isEmpty: true);

  factory TodoState.success(List<TodoItem> items) => TodoState(items: items);

  factory TodoState.error(String errorMessage) =>
      TodoState(errorMessage: errorMessage);
}
