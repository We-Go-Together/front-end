import 'package:herewego/domain/auth/entity/user_profile.dart';
import 'package:herewego/domain/result.dart';
import 'package:herewego/domain/todo/usecase/todo/dto/update_todo_dto.dart';

import 'todo/entity/todo_item.dart';

abstract class DataRepository {
  Future<Result<UserProfile>> login(String email, String password);

  Future<Result<void>> logout();

  Future<Result<UserProfile>> register(String email, String password, String name);

  Future<Result<UserProfile>> getUser();

  Future<Result<bool>> isLogin();

  Future<Result<void>> addTodoItem(String text);

  Future<Result<List<TodoItem>>> getTodoItems();

  Future<Result<void>> updateTodoItem(UpdateTodoDto dto);

  Future<Result<void>> deleteTodoItem(String todoId);

}