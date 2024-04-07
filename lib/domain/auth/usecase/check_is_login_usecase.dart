import 'package:herewego/domain/data_repository.dart';
import 'package:herewego/domain/result.dart';
import 'package:injectable/injectable.dart';

import '../../usecase.dart';

@injectable
class CheckIsLoginUseCase implements UseCase<bool, void> {
  final DataRepository _dataRepository;

  CheckIsLoginUseCase({required DataRepository dataRepository}) : _dataRepository = dataRepository;

  @override
  Future<bool> call(void params, {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.isLogin();
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }

  
}