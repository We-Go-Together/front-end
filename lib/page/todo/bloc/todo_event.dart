part of 'todo_bloc.dart';

// 해당 파트는 이벤트 동작을 수행하는 함수를 적는것이 아닌 정의만 하는 영역
sealed class TodoEvent {
  const TodoEvent();
}

final class LoadTodoItem extends TodoEvent {
  const LoadTodoItem();
}

final class AddTodoItem extends TodoEvent {
  final String text;

  const AddTodoItem(this.text);
}

final class UpdateTodoItem extends TodoEvent {
  final String id;
  final bool done;

  const UpdateTodoItem(this.id, this.done);
}

final class DeleteTodoItem extends TodoEvent {
  final String todoId;

  const DeleteTodoItem(this.todoId);
}
