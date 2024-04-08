import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herewego/domain/todo/entity/todo_item.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(TodoState(
          isLoading: false,
          isEmpty: false,
          items: [],
          errorMessage: '',
        )) {
    on<LoadTodoItem>(_loadTodoItem);
    on<AddTodoItem>(_addTodoItem);
    on<UpdateTodoItem>(_updateTodoItem);
    on<DeleteTodoItem>(_deleteTodoItem);
  }

  FutureOr<void> _loadTodoItem(LoadTodoItem event, Emitter<TodoState> emit) {
    // TODO : 실제 행위 정의
  }

  FutureOr<void> _addTodoItem(AddTodoItem event, Emitter<TodoState> emit) {
    // TODO : 실제 행위 정의
  }

  FutureOr<void> _updateTodoItem(UpdateTodoItem event, Emitter<TodoState> emit) {
    // TODO : 실제 행위 정의
  }

  FutureOr<void> _deleteTodoItem(DeleteTodoItem event, Emitter<TodoState> emit) {
    // TODO : 실제 행위 정의
  }
}
