import 'package:herewego/domain/data_repository.dart';
import 'package:herewego/domain/result.dart';
import 'package:herewego/domain/todo/entity/todo_item.dart';
import 'package:herewego/domain/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTodoItemUseCase implements UseCase<List<TodoItem>, void> {
  final DataRepository _dataRepository;

  const GetTodoItemUseCase(this._dataRepository);

  @override
  Future<List<TodoItem>> call(void params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.getTodoItems();
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }
}

// 여기에 카카오 로그인을 추가하려 한다면 ? Let's deep dive !!!