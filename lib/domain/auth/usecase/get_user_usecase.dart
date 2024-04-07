import 'package:herewego/domain/auth/entity/user_profile.dart';
import 'package:herewego/domain/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../data_repository.dart';
import '../../result.dart';

@injectable
class GetUserUseCase implements UseCase<UserProfile, void> {
  final DataRepository _dataRepository;

  const GetUserUseCase(this._dataRepository);

  @override
  Future<UserProfile> call(void params, {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.getUser();
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }

}