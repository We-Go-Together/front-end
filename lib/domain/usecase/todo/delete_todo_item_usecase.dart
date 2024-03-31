import 'package:injectable/injectable.dart';

import '../../data_repository.dart';
import '../../result.dart';
import '../../usecase.dart';

@injectable
class DeleteTodoItemUseCase implements UseCase<void, String> {
  final DataRepository _dataRepository;

  const DeleteTodoItemUseCase(this._dataRepository);

  @override
  Future<void> call(String params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.deleteTodoItem(params);
    if (result is ResultError) {
      onError(result.error!);
    }
  }
}
