import 'package:herewego/domain/data_repository.dart';
import 'package:herewego/domain/result.dart';
import 'package:herewego/domain/usecase.dart';
import 'package:injectable/injectable.dart';


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
