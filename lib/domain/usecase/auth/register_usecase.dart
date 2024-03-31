import 'package:herewego/domain/entity/user_profile.dart';
import 'package:herewego/domain/usecase.dart';
import 'package:herewego/domain/usecase/auth/dto/register_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data_repository.dart';
import '../../result.dart';

@injectable
class RegisterUseCase implements UseCase<UserProfile, RegisterDto> {
  final DataRepository _dataRepository;

  const RegisterUseCase(this._dataRepository);

  @override
  Future<UserProfile> call(RegisterDto params,
      {required ResultErrorCallback onError}) async {
    final result = await _dataRepository.register(
        params.email, params.password, params.name);
    if (result is ResultError) {
      onError(result.error!);
    }
    return result.data!;
  }
}
