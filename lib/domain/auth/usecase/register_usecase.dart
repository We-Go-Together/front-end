import 'package:herewego/domain/auth/entity/user_profile.dart';
import 'package:herewego/domain/auth/usecase/dto/register_dto.dart';
import 'package:herewego/domain/usecase.dart';
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
