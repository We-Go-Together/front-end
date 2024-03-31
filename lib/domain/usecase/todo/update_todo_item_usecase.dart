import 'package:herewego/domain/usecase/todo/dto/update_todo_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data_repository.dart';
import '../../result.dart';
import '../../usecase.dart';

@injectable
class UpdateTodoItemUseCase implements UseCase<void, UpdateTodoDto> {
  final DataRepository _dataRepository;

  const UpdateTodoItemUseCase(this._dataRepository);

  @override
  Future<void> call(UpdateTodoDto params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.updateTodoItem(params);
    if (result is ResultError) {
      onError(result.error!);
    }
  }
}
