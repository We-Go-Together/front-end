import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herewego/domain/todo/entity/todo_item.dart';
import 'package:herewego/domain/todo/usecase/todo/add_todo_item_usecase.dart';
import 'package:herewego/domain/todo/usecase/todo/delete_todo_item_usecase.dart';
import 'package:herewego/domain/todo/usecase/todo/dto/update_todo_dto.dart';
import 'package:herewego/domain/todo/usecase/todo/get_todo_item_usecase.dart';
import 'package:herewego/domain/todo/usecase/todo/update_todo_item_usecase.dart';
import 'package:herewego/injector.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(TodoState(
          isLoading: false,
          isEmpty: true,
          items: [],
          errorMessage: null,
        )) {
    on<LoadTodoItem>(_loadTodoItem);
    on<AddTodoItem>(_addTodoItem);
    on<UpdateTodoItem>(_updateTodoItem);
    on<DeleteTodoItem>(_deleteTodoItem);
  }

  FutureOr<void> _loadTodoItem(
      LoadTodoItem event, Emitter<TodoState> emit) async* {
    // TODO : 실제 행위 정의
    final getTodoItemsUseCase = locator<GetTodoItemUseCase>();
    final result = await getTodoItemsUseCase(null, onError: (error) {
      final newState = state.copyWith(errorMessage: '오류 발생');
      emit(newState);
    });
    final newState = state.copyWith(
      isEmpty: false,
      items: result,
    );
    emit(newState);
    // state가 isEmpty인지 아닌지 판별하고 그 후에 emit해야함.
  }

  // add update delete에서는 기존에는 다시 loadtTodoItem 메서드를 호출하는 형식이었음. 그러나 parameter 형식상 불가
  // 따라서 해당 로직을 불러오는 곳에사 loaddTodoItem을 또 호출하는 형식으로 구현.

  FutureOr<void> _addTodoItem(
      AddTodoItem event, Emitter<TodoState> emit) async* {
    final newTodoItem = event.text;
    // TODO : 실제 행위 정의
    final addTodoItemUseCase = locator<AddTodoItemUseCase>();
    await addTodoItemUseCase(newTodoItem, onError: (error) {
      final newState = state.copyWith(errorMessage: '오류 발생');
      emit(newState);
    });
  }

  FutureOr<void> _updateTodoItem(
      UpdateTodoItem event, Emitter<TodoState> emit) async* {
    // TODO : 실제 행위 정의
    final updateTodoItemUseCase = locator<UpdateTodoItemUseCase>();

    await updateTodoItemUseCase(UpdateTodoDto(id: event.id, done: event.done),
        onError: (error) {
      final newState = state.copyWith(errorMessage: '오류 발생');
      emit(newState);
    });
  }

  FutureOr<void> _deleteTodoItem(
      DeleteTodoItem event, Emitter<TodoState> emit) async* {
    // TODO : 실제 행위 정의
    final deleteTodoItemUseCase = locator<DeleteTodoItemUseCase>();

    await deleteTodoItemUseCase(event.todoId, onError: (error) {
      final newState = state.copyWith(errorMessage: '오류 발생');
      emit(newState);
    });
  }
}
